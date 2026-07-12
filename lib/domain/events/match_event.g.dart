// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchStartedEvent _$MatchStartedEventFromJson(Map<String, dynamic> json) =>
    MatchStartedEvent(
      matchId: json['matchId'] as String,
      config: MatchConfiguration.fromJson(
        json['config'] as Map<String, dynamic>,
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tossWinner: json['tossWinner'] as String? ?? 'Team 1',
      tossDecision: json['tossDecision'] as String? ?? 'Bat',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MatchStartedEventToJson(MatchStartedEvent instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'config': instance.config,
      'timestamp': instance.timestamp.toIso8601String(),
      'tossWinner': instance.tossWinner,
      'tossDecision': instance.tossDecision,
      'runtimeType': instance.$type,
    };

DeliveryRecordedEvent _$DeliveryRecordedEventFromJson(
  Map<String, dynamic> json,
) => DeliveryRecordedEvent(
  matchId: json['matchId'] as String,
  bowlerId: json['bowlerId'] as String,
  strikerId: json['strikerId'] as String,
  nonStrikerId: json['nonStrikerId'] as String?,
  runsOffBat: (json['runsOffBat'] as num?)?.toInt() ?? 0,
  extras:
      (json['extras'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ExtraTypeEnumMap, e))
          .toList() ??
      const [],
  wicket: json['wicket'] == null
      ? null
      : Wicket.fromJson(json['wicket'] as Map<String, dynamic>),
  timestamp: DateTime.parse(json['timestamp'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DeliveryRecordedEventToJson(
  DeliveryRecordedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'bowlerId': instance.bowlerId,
  'strikerId': instance.strikerId,
  'nonStrikerId': instance.nonStrikerId,
  'runsOffBat': instance.runsOffBat,
  'extras': instance.extras.map((e) => _$ExtraTypeEnumMap[e]!).toList(),
  'wicket': instance.wicket,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

const _$ExtraTypeEnumMap = {
  ExtraType.wide: 'wide',
  ExtraType.noBall: 'noBall',
  ExtraType.bye: 'bye',
  ExtraType.legBye: 'legBye',
  ExtraType.penaltyRuns: 'penaltyRuns',
};

PlayerAddedEvent _$PlayerAddedEventFromJson(Map<String, dynamic> json) =>
    PlayerAddedEvent(
      matchId: json['matchId'] as String,
      playerId: json['playerId'] as String,
      name: json['name'] as String,
      teamId: json['teamId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PlayerAddedEventToJson(PlayerAddedEvent instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'playerId': instance.playerId,
      'name': instance.name,
      'teamId': instance.teamId,
      'timestamp': instance.timestamp.toIso8601String(),
      'runtimeType': instance.$type,
    };

BatterSelectedEvent _$BatterSelectedEventFromJson(Map<String, dynamic> json) =>
    BatterSelectedEvent(
      matchId: json['matchId'] as String,
      strikerId: json['strikerId'] as String,
      nonStrikerId: json['nonStrikerId'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$BatterSelectedEventToJson(
  BatterSelectedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'strikerId': instance.strikerId,
  'nonStrikerId': instance.nonStrikerId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

BowlerSelectedEvent _$BowlerSelectedEventFromJson(Map<String, dynamic> json) =>
    BowlerSelectedEvent(
      matchId: json['matchId'] as String,
      bowlerId: json['bowlerId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$BowlerSelectedEventToJson(
  BowlerSelectedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'bowlerId': instance.bowlerId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

InningsStartedEvent _$InningsStartedEventFromJson(Map<String, dynamic> json) =>
    InningsStartedEvent(
      matchId: json['matchId'] as String,
      battingTeamId: json['battingTeamId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$InningsStartedEventToJson(
  InningsStartedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'battingTeamId': instance.battingTeamId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

OverCompletedEvent _$OverCompletedEventFromJson(Map<String, dynamic> json) =>
    OverCompletedEvent(
      matchId: json['matchId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$OverCompletedEventToJson(OverCompletedEvent instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'timestamp': instance.timestamp.toIso8601String(),
      'runtimeType': instance.$type,
    };

SessionEndedEvent _$SessionEndedEventFromJson(Map<String, dynamic> json) =>
    SessionEndedEvent(
      matchId: json['matchId'] as String,
      sessionName: json['sessionName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionEndedEventToJson(SessionEndedEvent instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'sessionName': instance.sessionName,
      'timestamp': instance.timestamp.toIso8601String(),
      'runtimeType': instance.$type,
    };

PlayerRenamedEvent _$PlayerRenamedEventFromJson(Map<String, dynamic> json) =>
    PlayerRenamedEvent(
      matchId: json['matchId'] as String,
      playerId: json['playerId'] as String,
      newName: json['newName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PlayerRenamedEventToJson(PlayerRenamedEvent instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'playerId': instance.playerId,
      'newName': instance.newName,
      'timestamp': instance.timestamp.toIso8601String(),
      'runtimeType': instance.$type,
    };

InningsCompletedEvent _$InningsCompletedEventFromJson(
  Map<String, dynamic> json,
) => InningsCompletedEvent(
  matchId: json['matchId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InningsCompletedEventToJson(
  InningsCompletedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

InningsDeclaredEvent _$InningsDeclaredEventFromJson(
  Map<String, dynamic> json,
) => InningsDeclaredEvent(
  matchId: json['matchId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$InningsDeclaredEventToJson(
  InningsDeclaredEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

MatchCompletedEvent _$MatchCompletedEventFromJson(Map<String, dynamic> json) =>
    MatchCompletedEvent(
      matchId: json['matchId'] as String,
      result: json['result'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MatchCompletedEventToJson(
  MatchCompletedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'result': instance.result,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

SuperOverStartedEvent _$SuperOverStartedEventFromJson(
  Map<String, dynamic> json,
) => SuperOverStartedEvent(
  matchId: json['matchId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuperOverStartedEventToJson(
  SuperOverStartedEvent instance,
) => <String, dynamic>{
  'matchId': instance.matchId,
  'timestamp': instance.timestamp.toIso8601String(),
  'runtimeType': instance.$type,
};

_Wicket _$WicketFromJson(Map<String, dynamic> json) => _Wicket(
  dismissedPlayerId: json['dismissedPlayerId'] as String,
  type: $enumDecode(_$DismissalTypeEnumMap, json['type']),
  fielderId: json['fielderId'] as String?,
);

Map<String, dynamic> _$WicketToJson(_Wicket instance) => <String, dynamic>{
  'dismissedPlayerId': instance.dismissedPlayerId,
  'type': _$DismissalTypeEnumMap[instance.type]!,
  'fielderId': instance.fielderId,
};

const _$DismissalTypeEnumMap = {
  DismissalType.bowled: 'bowled',
  DismissalType.caught: 'caught',
  DismissalType.lbw: 'lbw',
  DismissalType.runOut: 'runOut',
  DismissalType.stumped: 'stumped',
  DismissalType.hitWicket: 'hitWicket',
  DismissalType.fieldRestriction: 'fieldRestriction',
  DismissalType.obstructingField: 'obstructingField',
  DismissalType.timedOut: 'timedOut',
  DismissalType.retiredHurt: 'retiredHurt',
  DismissalType.retiredOut: 'retiredOut',
};
