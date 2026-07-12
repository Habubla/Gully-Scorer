// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchConfiguration _$MatchConfigurationFromJson(Map<String, dynamic> json) =>
    _MatchConfiguration(
      format: $enumDecode(_$MatchFormatEnumMap, json['format']),
      maxOvers: (json['maxOvers'] as num?)?.toDouble(),
      playersPerTeam: (json['playersPerTeam'] as num).toInt(),
      team1Name: json['team1Name'] as String? ?? 'Team 1',
      team2Name: json['team2Name'] as String? ?? 'Team 2',
      lastManStanding: json['lastManStanding'] as bool? ?? true,
    );

Map<String, dynamic> _$MatchConfigurationToJson(_MatchConfiguration instance) =>
    <String, dynamic>{
      'format': _$MatchFormatEnumMap[instance.format]!,
      'maxOvers': instance.maxOvers,
      'playersPerTeam': instance.playersPerTeam,
      'team1Name': instance.team1Name,
      'team2Name': instance.team2Name,
      'lastManStanding': instance.lastManStanding,
    };

const _$MatchFormatEnumMap = {
  MatchFormat.whiteBall: 'whiteBall',
  MatchFormat.redBall: 'redBall',
};
