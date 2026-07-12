import 'package:freezed_annotation/freezed_annotation.dart';
import 'player_state.dart';
import 'match_configuration.dart';

part 'match_state.freezed.dart';
part 'match_state.g.dart';

@freezed
abstract class MatchState with _$MatchState {
  const factory MatchState({
    required String matchId,
    required MatchConfiguration config,
    @Default(0) int totalRuns,
    @Default(0) int totalWickets,
    @Default(0) int legalDeliveries,
    @Default([]) List<PlayerState> players,
    String? currentStrikerId,
    String? currentNonStrikerId,
    String? currentBowlerId,
    @Default(InningsStatus.notStarted) InningsStatus inningsStatus,
    @Default(MatchStatus.creating) MatchStatus matchStatus,
    int? targetScore,
    String? matchResult,
    @Default('team_1') String firstInningsBattingTeamId,
    @Default('team_1') String currentBattingTeamId,
    @Default(1) int inningsCount,
    @Default(0) int team1Score,
    @Default(0) int team2Score,
    @Default(0) int runsInCurrentOver,
    @Default(false) bool isFreeHit,
  }) = _MatchState;

  factory MatchState.fromJson(Map<String, dynamic> json) => _$MatchStateFromJson(json);
}

enum InningsStatus {
  notStarted,
  running,
  declared,
  completed
}

enum MatchStatus {
  creating,
  ready,
  running,
  paused,
  completed,
  archived
}
