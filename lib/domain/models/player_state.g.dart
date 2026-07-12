// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerState _$PlayerStateFromJson(Map<String, dynamic> json) => _PlayerState(
  id: json['id'] as String,
  name: json['name'] as String,
  teamId: json['teamId'] as String,
  runsScored: (json['runsScored'] as num?)?.toInt() ?? 0,
  ballsFaced: (json['ballsFaced'] as num?)?.toInt() ?? 0,
  fours: (json['fours'] as num?)?.toInt() ?? 0,
  sixes: (json['sixes'] as num?)?.toInt() ?? 0,
  wicketsTaken: (json['wicketsTaken'] as num?)?.toInt() ?? 0,
  ballsBowled: (json['ballsBowled'] as num?)?.toInt() ?? 0,
  runsConceded: (json['runsConceded'] as num?)?.toInt() ?? 0,
  maidens: (json['maidens'] as num?)?.toInt() ?? 0,
  status:
      $enumDecodeNullable(_$PlayerMatchStatusEnumMap, json['status']) ??
      PlayerMatchStatus.waiting,
  hasBatted: json['hasBatted'] as bool? ?? false,
  dismissalDetails: json['dismissalDetails'] as String? ?? '',
);

Map<String, dynamic> _$PlayerStateToJson(_PlayerState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamId': instance.teamId,
      'runsScored': instance.runsScored,
      'ballsFaced': instance.ballsFaced,
      'fours': instance.fours,
      'sixes': instance.sixes,
      'wicketsTaken': instance.wicketsTaken,
      'ballsBowled': instance.ballsBowled,
      'runsConceded': instance.runsConceded,
      'maidens': instance.maidens,
      'status': _$PlayerMatchStatusEnumMap[instance.status]!,
      'hasBatted': instance.hasBatted,
      'dismissalDetails': instance.dismissalDetails,
    };

const _$PlayerMatchStatusEnumMap = {
  PlayerMatchStatus.waiting: 'waiting',
  PlayerMatchStatus.batting: 'batting',
  PlayerMatchStatus.dismissed: 'dismissed',
  PlayerMatchStatus.retiredHurt: 'retiredHurt',
  PlayerMatchStatus.retiredOut: 'retiredOut',
};
