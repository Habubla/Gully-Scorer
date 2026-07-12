import 'package:flutter_test/flutter_test.dart';
import 'package:hab_gullyscorer/domain/events/match_event.dart';
import 'package:hab_gullyscorer/domain/models/match_configuration.dart';
import 'package:hab_gullyscorer/domain/models/match_state.dart';
import 'package:hab_gullyscorer/domain/models/player_state.dart';
import 'package:hab_gullyscorer/engine/statistics_engine.dart';

void main() {
  group('StatisticsEngine Tests', () {
    late MatchState initialState;
    late MatchConfiguration config;

    setUp(() {
      config = const MatchConfiguration(
        format: MatchFormat.whiteBall,
        playersPerTeam: 11,
        maxOvers: 20,
        lastManStanding: true,
      );

      initialState = MatchState(
        matchId: 'match_1',
        config: config,
        players: [
          const PlayerState(id: 'p1', name: 'Batter 1', teamId: 't1', status: PlayerMatchStatus.batting),
          const PlayerState(id: 'p2', name: 'Batter 2', teamId: 't1', status: PlayerMatchStatus.batting),
          const PlayerState(id: 'p3', name: 'Batter 3', teamId: 't1'),
          const PlayerState(id: 'b1', name: 'Bowler 1', teamId: 't2'),
        ],
        currentStrikerId: 'p1',
        currentNonStrikerId: 'p2',
        currentBowlerId: 'b1',
        matchStatus: MatchStatus.running,
        inningsStatus: InningsStatus.running,
      );
    });

    test('Single run rotates strike and credits batter/bowler', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 1,
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      expect(state.totalRuns, 1);
      expect(state.legalDeliveries, 1);
      expect(state.currentStrikerId, 'p2');
      expect(state.currentNonStrikerId, 'p1');

      final batter1 = state.players.firstWhere((p) => p.id == 'p1');
      expect(batter1.runsScored, 1);
      expect(batter1.ballsFaced, 1);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.runsConceded, 1);
      expect(bowler.ballsBowled, 1);
    });

    test('Wide ball adds 1 run, does not consume ball, does not credit batter runs', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          extras: [ExtraType.wide],
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      expect(state.totalRuns, 1);
      expect(state.legalDeliveries, 0);
      expect(state.currentStrikerId, 'p1');

      final batter1 = state.players.firstWhere((p) => p.id == 'p1');
      expect(batter1.runsScored, 0);
      expect(batter1.ballsFaced, 0);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.runsConceded, 1);
      expect(bowler.ballsBowled, 0);
    });

    test('Field restriction dismissal credits bowler', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          wicket: Wicket(dismissedPlayerId: 'p1', type: DismissalType.fieldRestriction),
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      expect(state.totalWickets, 1);
      
      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.wicketsTaken, 1);

      final batter1 = state.players.firstWhere((p) => p.id == 'p1');
      expect(batter1.status, PlayerMatchStatus.dismissed);
    });

    test('Last Man Standing activates when 10 wickets fall (for 11 players)', () {
      // Simulate 9 wickets having fallen, p1 and p2 are the last pair
      var customState = initialState.copyWith(
         players: [
          const PlayerState(id: 'p1', name: 'Batter 1', teamId: 't1', status: PlayerMatchStatus.batting),
          const PlayerState(id: 'p2', name: 'Batter 2', teamId: 't1', status: PlayerMatchStatus.batting),
          ...List.generate(9, (i) => PlayerState(id: 'out_$i', name: 'Out $i', teamId: 't1', status: PlayerMatchStatus.dismissed)),
          const PlayerState(id: 'b1', name: 'Bowler 1', teamId: 't2'),
        ]
      );

      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          wicket: Wicket(dismissedPlayerId: 'p1', type: DismissalType.bowled),
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(customState, events);

      expect(state.currentStrikerId, 'p2');
      expect(state.currentNonStrikerId, null);
    });

    test('Bye does NOT count against bowler runs conceded', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          extras: [ExtraType.bye],
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      // The bye adds 0 to the total (no runs off bat, no wide/nb penalty)
      // but the team still gets 0 runs from this delivery in terms of bowler conceded
      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.runsConceded, 0, reason: 'Byes should not count against bowler');
      expect(bowler.ballsBowled, 1);
    });

    test('Leg-bye does NOT count against bowler runs conceded', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          extras: [ExtraType.legBye],
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.runsConceded, 0, reason: 'Leg-byes should not count against bowler');
      expect(bowler.ballsBowled, 1);
    });

    test('No-ball with 2 runs off bat charges bowler correctly (1 NB + 2 runs = 3)', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 2,
          extras: [ExtraType.noBall],
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      expect(state.totalRuns, 3); // 2 off bat + 1 no-ball penalty
      expect(state.legalDeliveries, 0); // no-ball is not a legal delivery

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.runsConceded, 3, reason: 'No-ball: 2 runs off bat + 1 penalty = 3 against bowler');
      expect(bowler.ballsBowled, 0);

      final batter = state.players.firstWhere((p) => p.id == 'p1');
      expect(batter.runsScored, 2);
      expect(batter.ballsFaced, 1); // Batter faces the ball on a no-ball
    });

    test('Run out does NOT credit bowler with a wicket', () {
      final events = [
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          wicket: Wicket(dismissedPlayerId: 'p1', type: DismissalType.runOut, fielderId: 'fielder1'),
          timestamp: DateTime.now(),
        )
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      expect(state.totalWickets, 1);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.wicketsTaken, 0, reason: 'Run outs should not be credited to the bowler');
    });

    test('Maiden over is tracked when bowler concedes 0 runs in 6 balls', () {
      // Bowl 6 dot balls then an over-completed event
      final events = <MatchEvent>[
        ...List.generate(6, (i) => DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          timestamp: DateTime.now(),
        )),
        OverCompletedEvent(matchId: 'match_1', timestamp: DateTime.now()),
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.maidens, 1, reason: '6 dot balls should be a maiden over');
      expect(bowler.ballsBowled, 6);
      expect(bowler.runsConceded, 0);
    });

    test('Non-maiden over (runs conceded) does NOT increment maidens', () {
      // Bowl 5 dots and 1 single, then over-completed
      final events = <MatchEvent>[
        ...List.generate(5, (i) => DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 0,
          timestamp: DateTime.now(),
        )),
        DeliveryRecordedEvent(
          matchId: 'match_1',
          bowlerId: 'b1',
          strikerId: 'p1',
          nonStrikerId: 'p2',
          runsOffBat: 1,
          timestamp: DateTime.now(),
        ),
        OverCompletedEvent(matchId: 'match_1', timestamp: DateTime.now()),
      ];

      final state = StatisticsEngine.reduce(initialState, events);

      final bowler = state.players.firstWhere((p) => p.id == 'b1');
      expect(bowler.maidens, 0, reason: 'Should not be a maiden if runs were conceded');
      expect(bowler.runsConceded, 1);
    });
  });
}
