import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/events/match_event.dart';
import '../domain/models/match_state.dart';
import '../domain/models/match_configuration.dart';
import '../database/repositories/event_repository.dart';
import '../engine/statistics_engine.dart';
import '../database/database.dart';

part 'match_service.g.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) => throw UnimplementedError());

@Riverpod(keepAlive: true)
class MatchStateNotifier extends _$MatchStateNotifier {
  late EventRepository repo;

  @override
  MatchState? build(String matchId) {
    repo = ref.watch(eventRepositoryProvider);
    loadMatch();
    return null;
  }

  Future<void> loadMatch() async {
    final events = await repo.getEventsForMatch(matchId);
    if (events.isNotEmpty) {
      final startEvent = events.first as MatchStartedEvent;
      final initialState = MatchState(matchId: matchId, config: startEvent.config);
      state = StatisticsEngine.reduce(initialState, events);
    }
  }

  Future<void> recordDelivery({
    required int runs,
    List<ExtraType> extras = const [],
    Wicket? wicket,
  }) async {
    if (state == null) return;
    
    if (state!.currentStrikerId == null || state!.currentBowlerId == null) return;

    final event = MatchEvent.deliveryRecorded(
      matchId: matchId,
      bowlerId: state!.currentBowlerId!,
      strikerId: state!.currentStrikerId!,
      nonStrikerId: state!.currentNonStrikerId,
      runsOffBat: runs,
      extras: extras,
      wicket: wicket,
      timestamp: DateTime.now(),
    );

    await repo.appendEvent(matchId, event);
    await loadMatch();
    
    _checkInningsEnd();
  }

  Future<void> _checkInningsEnd() async {
    if (state == null) return;
    
    // Check if innings is already over
    if (state!.inningsStatus == InningsStatus.completed || state!.inningsStatus == InningsStatus.declared || state!.matchStatus == MatchStatus.completed) return;

    bool isOversComplete = false;
    if (state!.config.maxOvers != null) {
      double overs = state!.config.maxOvers!;
      int maxDeliveries = (overs.floor() * 6) + ((overs - overs.floor()) * 10).round();
      if (state!.legalDeliveries >= maxDeliveries) {
        isOversComplete = true;
      }
    }

    bool isAllOut = false;
    int allowedWickets = state!.config.lastManStanding ? state!.config.playersPerTeam : state!.config.playersPerTeam - 1;
    if (state!.totalWickets >= allowedWickets) {
      isAllOut = true;
    }
    
    bool targetChased = false;
    if (state!.targetScore != null && state!.totalRuns >= state!.targetScore!) {
      targetChased = true;
    }

    if (targetChased) {
       await endMatch("Batting Team Won by chasing target");
    } else if (isOversComplete || isAllOut) {
       if (state!.config.format == MatchFormat.whiteBall) {
          if (state!.targetScore == null) {
             // End of 1st innings
             final endEvent = MatchEvent.inningsCompleted(matchId: matchId, timestamp: DateTime.now());
             await repo.appendEvent(matchId, endEvent);
             await loadMatch();
          } else {
             // End of 2nd innings
             if (state!.totalRuns == state!.targetScore! - 1) {
                await endMatch("Match Tied");
             } else if (state!.totalRuns < state!.targetScore! - 1) {
                await endMatch("Bowling Team Won by defending target");
             }
          }
       } else {
          // Red ball format
          final endEvent = MatchEvent.inningsCompleted(matchId: matchId, timestamp: DateTime.now());
          await repo.appendEvent(matchId, endEvent);
          await loadMatch();
          
          if (state!.inningsCount > 4) {
             // Match over!
             await endMatch("Match Drawn (or Innings Complete)");
          }
       }
    } else {
       // Check for over completion just normally
       if (state!.legalDeliveries > 0 && state!.legalDeliveries % 6 == 0) {
           final overEvent = MatchEvent.overCompleted(
             matchId: matchId, 
             timestamp: DateTime.now()
           );
           await repo.appendEvent(matchId, overEvent);
           await loadMatch();
       }
    }
  }

  Future<void> endMatch(String result) async {
    final event = MatchEvent.matchCompleted(matchId: matchId, result: result, timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
    
    if (state != null) {
       final stats = state!.players.map((p) => PlayerGlobalStat(
          playerId: p.id,
          name: p.name,
          matchesPlayed: 1,
          totalRuns: p.runsScored,
          totalBallsFaced: p.ballsFaced,
          totalFours: p.fours,
          totalSixes: p.sixes,
          totalOversBowled: p.ballsBowled ~/ 6,
          totalBallsBowled: p.ballsBowled,
          totalRunsConceded: p.runsConceded,
          totalWicketsTaken: p.wicketsTaken,
          highestScore: p.runsScored,
          bestBowlingWickets: p.wicketsTaken,
          bestBowlingRuns: p.runsConceded
       )).toList();
       await repo.upsertPlayerStats(stats);
    }
  }

  void updateTargetScore(int newTarget) {
     if (state != null) {
        state = state!.copyWith(targetScore: newTarget);
     }
  }

  Future<void> startSuperOver() async {
    final event = MatchEvent.superOverStarted(matchId: matchId, timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> renamePlayer(String playerId, String newName) async {
    final event = MatchEvent.playerRenamed(matchId: matchId, playerId: playerId, newName: newName, timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> startSecondInnings() async {
    final event = MatchEvent.inningsStarted(matchId: matchId, battingTeamId: 'bowling_team', timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> declareInnings() async {
    final event = MatchEvent.inningsDeclared(matchId: matchId, timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> startNextInnings(String battingTeamId) async {
    final event = MatchEvent.inningsStarted(matchId: matchId, battingTeamId: battingTeamId, timestamp: DateTime.now());
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> startMatch(MatchConfiguration config, {String tossWinner = 'Team 1', String tossDecision = 'Bat'}) async {
    final event = MatchEvent.matchStarted(
      matchId: matchId,
      config: config,
      tossWinner: tossWinner,
      tossDecision: tossDecision,
      timestamp: DateTime.now()
    );
    await repo.createNewMatch(matchId, config, event);
    await loadMatch();
  }

  Future<void> addPlayer(String name, String teamId) async {
    final event = MatchEvent.playerAdded(
      matchId: matchId,
      playerId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      teamId: teamId,
      timestamp: DateTime.now(),
    );
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> selectBatters({required String strikerId, String? nonStrikerId}) async {
    final event = MatchEvent.batterSelected(
      matchId: matchId,
      strikerId: strikerId,
      nonStrikerId: nonStrikerId,
      timestamp: DateTime.now(),
    );
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> swapStrike() async {
    if (state?.currentStrikerId != null && state?.currentNonStrikerId != null) {
       await selectBatters(strikerId: state!.currentNonStrikerId!, nonStrikerId: state!.currentStrikerId);
    }
  }

  Future<void> selectBowler(String bowlerId) async {
    final event = MatchEvent.bowlerSelected(
      matchId: matchId,
      bowlerId: bowlerId,
      timestamp: DateTime.now(),
    );
    await repo.appendEvent(matchId, event);
    await loadMatch();
  }

  Future<void> undo() async {
    await repo.undo(matchId);
    await loadMatch();
  }

  Future<void> redo() async {
    await repo.redo(matchId);
    await loadMatch();
  }

  Future<void> updateFielderName(String dismissedPlayerId, String newFielderName) async {
    await repo.updateFielderNameForDismissal(matchId, dismissedPlayerId, newFielderName);
    await loadMatch();
  }
}
