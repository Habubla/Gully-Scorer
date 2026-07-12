// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchState _$MatchStateFromJson(Map<String, dynamic> json) => _MatchState(
  matchId: json['matchId'] as String,
  config: MatchConfiguration.fromJson(json['config'] as Map<String, dynamic>),
  totalRuns: (json['totalRuns'] as num?)?.toInt() ?? 0,
  totalWickets: (json['totalWickets'] as num?)?.toInt() ?? 0,
  legalDeliveries: (json['legalDeliveries'] as num?)?.toInt() ?? 0,
  players:
      (json['players'] as List<dynamic>?)
          ?.map((e) => PlayerState.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currentStrikerId: json['currentStrikerId'] as String?,
  currentNonStrikerId: json['currentNonStrikerId'] as String?,
  currentBowlerId: json['currentBowlerId'] as String?,
  inningsStatus:
      $enumDecodeNullable(_$InningsStatusEnumMap, json['inningsStatus']) ??
      InningsStatus.notStarted,
  matchStatus:
      $enumDecodeNullable(_$MatchStatusEnumMap, json['matchStatus']) ??
      MatchStatus.creating,
  targetScore: (json['targetScore'] as num?)?.toInt(),
  matchResult: json['matchResult'] as String?,
  firstInningsBattingTeamId:
      json['firstInningsBattingTeamId'] as String? ?? 'team_1',
  currentBattingTeamId: json['currentBattingTeamId'] as String? ?? 'team_1',
  inningsCount: (json['inningsCount'] as num?)?.toInt() ?? 1,
  team1Score: (json['team1Score'] as num?)?.toInt() ?? 0,
  team2Score: (json['team2Score'] as num?)?.toInt() ?? 0,
  runsInCurrentOver: (json['runsInCurrentOver'] as num?)?.toInt() ?? 0,
  isFreeHit: json['isFreeHit'] as bool? ?? false,
);

Map<String, dynamic> _$MatchStateToJson(_MatchState instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'config': instance.config,
      'totalRuns': instance.totalRuns,
      'totalWickets': instance.totalWickets,
      'legalDeliveries': instance.legalDeliveries,
      'players': instance.players,
      'currentStrikerId': instance.currentStrikerId,
      'currentNonStrikerId': instance.currentNonStrikerId,
      'currentBowlerId': instance.currentBowlerId,
      'inningsStatus': _$InningsStatusEnumMap[instance.inningsStatus]!,
      'matchStatus': _$MatchStatusEnumMap[instance.matchStatus]!,
      'targetScore': instance.targetScore,
      'matchResult': instance.matchResult,
      'firstInningsBattingTeamId': instance.firstInningsBattingTeamId,
      'currentBattingTeamId': instance.currentBattingTeamId,
      'inningsCount': instance.inningsCount,
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
      'runsInCurrentOver': instance.runsInCurrentOver,
      'isFreeHit': instance.isFreeHit,
    };

const _$InningsStatusEnumMap = {
  InningsStatus.notStarted: 'notStarted',
  InningsStatus.running: 'running',
  InningsStatus.declared: 'declared',
  InningsStatus.completed: 'completed',
};

const _$MatchStatusEnumMap = {
  MatchStatus.creating: 'creating',
  MatchStatus.ready: 'ready',
  MatchStatus.running: 'running',
  MatchStatus.paused: 'paused',
  MatchStatus.completed: 'completed',
  MatchStatus.archived: 'archived',
};
