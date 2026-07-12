import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';
part 'player_state.g.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState({
    required String id,
    required String name,
    required String teamId,
    @Default(0) int runsScored,
    @Default(0) int ballsFaced,
    @Default(0) int fours,
    @Default(0) int sixes,
    @Default(0) int wicketsTaken,
    @Default(0) int ballsBowled,
    @Default(0) int runsConceded,
    @Default(0) int maidens,
    @Default(PlayerMatchStatus.waiting) PlayerMatchStatus status,
    @Default(false) bool hasBatted,
    @Default('') String dismissalDetails,
  }) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);
}

enum PlayerMatchStatus {
  waiting,
  batting,
  dismissed,
  retiredHurt,
  retiredOut,
}
