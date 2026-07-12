import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_configuration.freezed.dart';
part 'match_configuration.g.dart';

@freezed
abstract class MatchConfiguration with _$MatchConfiguration {
  const factory MatchConfiguration({
    required MatchFormat format,
    required double? maxOvers,
    required int playersPerTeam,
    @Default('Team 1') String team1Name,
    @Default('Team 2') String team2Name,
    @Default(true) bool lastManStanding,
  }) = _MatchConfiguration;

  factory MatchConfiguration.fromJson(Map<String, dynamic> json) => _$MatchConfigurationFromJson(json);
}

enum MatchFormat {
  whiteBall,
  redBall
}
