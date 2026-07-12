import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/match_configuration.dart';

part 'match_event.freezed.dart';
part 'match_event.g.dart';

@freezed
sealed class MatchEvent with _$MatchEvent {
  const factory MatchEvent.matchStarted({
    required String matchId,
    required MatchConfiguration config,
    required DateTime timestamp,
    @Default('Team 1') String tossWinner,
    @Default('Bat') String tossDecision,
  }) = MatchStartedEvent;

  const factory MatchEvent.deliveryRecorded({
    required String matchId,
    required String bowlerId,
    required String strikerId,
    String? nonStrikerId, // Nullable for Last Man Standing
    @Default(0) int runsOffBat,
    @Default([]) List<ExtraType> extras,
    Wicket? wicket,
    required DateTime timestamp,
  }) = DeliveryRecordedEvent;
  
  const factory MatchEvent.playerAdded({
    required String matchId,
    required String playerId,
    required String name,
    required String teamId,
    required DateTime timestamp,
  }) = PlayerAddedEvent;

  const factory MatchEvent.batterSelected({
    required String matchId,
    required String strikerId,
    String? nonStrikerId,
    required DateTime timestamp,
  }) = BatterSelectedEvent;

  const factory MatchEvent.bowlerSelected({
    required String matchId,
    required String bowlerId,
    required DateTime timestamp,
  }) = BowlerSelectedEvent;
  
  const factory MatchEvent.inningsStarted({
    required String matchId,
    required String battingTeamId,
    required DateTime timestamp,
  }) = InningsStartedEvent;

  const factory MatchEvent.overCompleted({
    required String matchId,
    required DateTime timestamp,
  }) = OverCompletedEvent;

  const factory MatchEvent.sessionEnded({ // For Red ball session tracking
    required String matchId,
    required String sessionName,
    required DateTime timestamp,
  }) = SessionEndedEvent;

  const factory MatchEvent.playerRenamed({
    required String matchId,
    required String playerId,
    required String newName,
    required DateTime timestamp,
  }) = PlayerRenamedEvent;

  const factory MatchEvent.inningsCompleted({
    required String matchId,
    required DateTime timestamp,
  }) = InningsCompletedEvent;

  const factory MatchEvent.inningsDeclared({
    required String matchId,
    required DateTime timestamp,
  }) = InningsDeclaredEvent;

  const factory MatchEvent.matchCompleted({
    required String matchId,
    required String result,
    required DateTime timestamp,
  }) = MatchCompletedEvent;

  const factory MatchEvent.superOverStarted({
    required String matchId,
    required DateTime timestamp,
  }) = SuperOverStartedEvent;

  factory MatchEvent.fromJson(Map<String, dynamic> json) => _$MatchEventFromJson(json);
}

enum ExtraType {
  wide,
  noBall,
  bye,
  legBye,
  penaltyRuns
}

@freezed
abstract class Wicket with _$Wicket {
  const factory Wicket({
    required String dismissedPlayerId,
    required DismissalType type,
    String? fielderId,
  }) = _Wicket;

  factory Wicket.fromJson(Map<String, dynamic> json) => _$WicketFromJson(json);
}

enum DismissalType {
  bowled,
  caught,
  lbw,
  runOut,
  stumped,
  hitWicket,
  fieldRestriction, // Credited to bowler as per new requirement
  obstructingField,
  timedOut,
  retiredHurt,
  retiredOut,
}
