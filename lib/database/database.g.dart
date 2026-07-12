// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MatchesTable extends Matches with TableInfo<$MatchesTable, Matche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _configMeta = const VerificationMeta('config');
  @override
  late final GeneratedColumn<String> config = GeneratedColumn<String>(
    'config',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentSequenceIndexMeta =
      const VerificationMeta('currentSequenceIndex');
  @override
  late final GeneratedColumn<int> currentSequenceIndex = GeneratedColumn<int>(
    'current_sequence_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    config,
    status,
    currentSequenceIndex,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'matches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Matche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('config')) {
      context.handle(
        _configMeta,
        config.isAcceptableOrUnknown(data['config']!, _configMeta),
      );
    } else if (isInserting) {
      context.missing(_configMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('current_sequence_index')) {
      context.handle(
        _currentSequenceIndexMeta,
        currentSequenceIndex.isAcceptableOrUnknown(
          data['current_sequence_index']!,
          _currentSequenceIndexMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Matche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Matche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      config: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}config'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      currentSequenceIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_sequence_index'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MatchesTable createAlias(String alias) {
    return $MatchesTable(attachedDatabase, alias);
  }
}

class Matche extends DataClass implements Insertable<Matche> {
  final String id;
  final String config;
  final String status;
  final int currentSequenceIndex;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Matche({
    required this.id,
    required this.config,
    required this.status,
    required this.currentSequenceIndex,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['config'] = Variable<String>(config);
    map['status'] = Variable<String>(status);
    map['current_sequence_index'] = Variable<int>(currentSequenceIndex);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MatchesCompanion toCompanion(bool nullToAbsent) {
    return MatchesCompanion(
      id: Value(id),
      config: Value(config),
      status: Value(status),
      currentSequenceIndex: Value(currentSequenceIndex),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Matche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matche(
      id: serializer.fromJson<String>(json['id']),
      config: serializer.fromJson<String>(json['config']),
      status: serializer.fromJson<String>(json['status']),
      currentSequenceIndex: serializer.fromJson<int>(
        json['currentSequenceIndex'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'config': serializer.toJson<String>(config),
      'status': serializer.toJson<String>(status),
      'currentSequenceIndex': serializer.toJson<int>(currentSequenceIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Matche copyWith({
    String? id,
    String? config,
    String? status,
    int? currentSequenceIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Matche(
    id: id ?? this.id,
    config: config ?? this.config,
    status: status ?? this.status,
    currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Matche copyWithCompanion(MatchesCompanion data) {
    return Matche(
      id: data.id.present ? data.id.value : this.id,
      config: data.config.present ? data.config.value : this.config,
      status: data.status.present ? data.status.value : this.status,
      currentSequenceIndex: data.currentSequenceIndex.present
          ? data.currentSequenceIndex.value
          : this.currentSequenceIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Matche(')
          ..write('id: $id, ')
          ..write('config: $config, ')
          ..write('status: $status, ')
          ..write('currentSequenceIndex: $currentSequenceIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    config,
    status,
    currentSequenceIndex,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matche &&
          other.id == this.id &&
          other.config == this.config &&
          other.status == this.status &&
          other.currentSequenceIndex == this.currentSequenceIndex &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MatchesCompanion extends UpdateCompanion<Matche> {
  final Value<String> id;
  final Value<String> config;
  final Value<String> status;
  final Value<int> currentSequenceIndex;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MatchesCompanion({
    this.id = const Value.absent(),
    this.config = const Value.absent(),
    this.status = const Value.absent(),
    this.currentSequenceIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MatchesCompanion.insert({
    required String id,
    required String config,
    required String status,
    this.currentSequenceIndex = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       config = Value(config),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Matche> custom({
    Expression<String>? id,
    Expression<String>? config,
    Expression<String>? status,
    Expression<int>? currentSequenceIndex,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (config != null) 'config': config,
      if (status != null) 'status': status,
      if (currentSequenceIndex != null)
        'current_sequence_index': currentSequenceIndex,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? config,
    Value<String>? status,
    Value<int>? currentSequenceIndex,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MatchesCompanion(
      id: id ?? this.id,
      config: config ?? this.config,
      status: status ?? this.status,
      currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(config.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (currentSequenceIndex.present) {
      map['current_sequence_index'] = Variable<int>(currentSequenceIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchesCompanion(')
          ..write('id: $id, ')
          ..write('config: $config, ')
          ..write('status: $status, ')
          ..write('currentSequenceIndex: $currentSequenceIndex, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MatchEventsTable extends MatchEvents
    with TableInfo<$MatchEventsTable, MatchEventData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _matchIdMeta = const VerificationMeta(
    'matchId',
  );
  @override
  late final GeneratedColumn<String> matchId = GeneratedColumn<String>(
    'match_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES matches (id)',
    ),
  );
  static const VerificationMeta _sequenceNumberMeta = const VerificationMeta(
    'sequenceNumber',
  );
  @override
  late final GeneratedColumn<int> sequenceNumber = GeneratedColumn<int>(
    'sequence_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    matchId,
    sequenceNumber,
    eventType,
    payload,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'match_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<MatchEventData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('match_id')) {
      context.handle(
        _matchIdMeta,
        matchId.isAcceptableOrUnknown(data['match_id']!, _matchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_matchIdMeta);
    }
    if (data.containsKey('sequence_number')) {
      context.handle(
        _sequenceNumberMeta,
        sequenceNumber.isAcceptableOrUnknown(
          data['sequence_number']!,
          _sequenceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sequenceNumberMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MatchEventData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MatchEventData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      matchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}match_id'],
      )!,
      sequenceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence_number'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $MatchEventsTable createAlias(String alias) {
    return $MatchEventsTable(attachedDatabase, alias);
  }
}

class MatchEventData extends DataClass implements Insertable<MatchEventData> {
  final String id;
  final String matchId;
  final int sequenceNumber;
  final String eventType;
  final String payload;
  final DateTime timestamp;
  const MatchEventData({
    required this.id,
    required this.matchId,
    required this.sequenceNumber,
    required this.eventType,
    required this.payload,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['match_id'] = Variable<String>(matchId);
    map['sequence_number'] = Variable<int>(sequenceNumber);
    map['event_type'] = Variable<String>(eventType);
    map['payload'] = Variable<String>(payload);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MatchEventsCompanion toCompanion(bool nullToAbsent) {
    return MatchEventsCompanion(
      id: Value(id),
      matchId: Value(matchId),
      sequenceNumber: Value(sequenceNumber),
      eventType: Value(eventType),
      payload: Value(payload),
      timestamp: Value(timestamp),
    );
  }

  factory MatchEventData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MatchEventData(
      id: serializer.fromJson<String>(json['id']),
      matchId: serializer.fromJson<String>(json['matchId']),
      sequenceNumber: serializer.fromJson<int>(json['sequenceNumber']),
      eventType: serializer.fromJson<String>(json['eventType']),
      payload: serializer.fromJson<String>(json['payload']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'matchId': serializer.toJson<String>(matchId),
      'sequenceNumber': serializer.toJson<int>(sequenceNumber),
      'eventType': serializer.toJson<String>(eventType),
      'payload': serializer.toJson<String>(payload),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  MatchEventData copyWith({
    String? id,
    String? matchId,
    int? sequenceNumber,
    String? eventType,
    String? payload,
    DateTime? timestamp,
  }) => MatchEventData(
    id: id ?? this.id,
    matchId: matchId ?? this.matchId,
    sequenceNumber: sequenceNumber ?? this.sequenceNumber,
    eventType: eventType ?? this.eventType,
    payload: payload ?? this.payload,
    timestamp: timestamp ?? this.timestamp,
  );
  MatchEventData copyWithCompanion(MatchEventsCompanion data) {
    return MatchEventData(
      id: data.id.present ? data.id.value : this.id,
      matchId: data.matchId.present ? data.matchId.value : this.matchId,
      sequenceNumber: data.sequenceNumber.present
          ? data.sequenceNumber.value
          : this.sequenceNumber,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      payload: data.payload.present ? data.payload.value : this.payload,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MatchEventData(')
          ..write('id: $id, ')
          ..write('matchId: $matchId, ')
          ..write('sequenceNumber: $sequenceNumber, ')
          ..write('eventType: $eventType, ')
          ..write('payload: $payload, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, matchId, sequenceNumber, eventType, payload, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MatchEventData &&
          other.id == this.id &&
          other.matchId == this.matchId &&
          other.sequenceNumber == this.sequenceNumber &&
          other.eventType == this.eventType &&
          other.payload == this.payload &&
          other.timestamp == this.timestamp);
}

class MatchEventsCompanion extends UpdateCompanion<MatchEventData> {
  final Value<String> id;
  final Value<String> matchId;
  final Value<int> sequenceNumber;
  final Value<String> eventType;
  final Value<String> payload;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const MatchEventsCompanion({
    this.id = const Value.absent(),
    this.matchId = const Value.absent(),
    this.sequenceNumber = const Value.absent(),
    this.eventType = const Value.absent(),
    this.payload = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MatchEventsCompanion.insert({
    required String id,
    required String matchId,
    required int sequenceNumber,
    required String eventType,
    required String payload,
    required DateTime timestamp,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       matchId = Value(matchId),
       sequenceNumber = Value(sequenceNumber),
       eventType = Value(eventType),
       payload = Value(payload),
       timestamp = Value(timestamp);
  static Insertable<MatchEventData> custom({
    Expression<String>? id,
    Expression<String>? matchId,
    Expression<int>? sequenceNumber,
    Expression<String>? eventType,
    Expression<String>? payload,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (matchId != null) 'match_id': matchId,
      if (sequenceNumber != null) 'sequence_number': sequenceNumber,
      if (eventType != null) 'event_type': eventType,
      if (payload != null) 'payload': payload,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MatchEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? matchId,
    Value<int>? sequenceNumber,
    Value<String>? eventType,
    Value<String>? payload,
    Value<DateTime>? timestamp,
    Value<int>? rowid,
  }) {
    return MatchEventsCompanion(
      id: id ?? this.id,
      matchId: matchId ?? this.matchId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      eventType: eventType ?? this.eventType,
      payload: payload ?? this.payload,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (matchId.present) {
      map['match_id'] = Variable<String>(matchId.value);
    }
    if (sequenceNumber.present) {
      map['sequence_number'] = Variable<int>(sequenceNumber.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchEventsCompanion(')
          ..write('id: $id, ')
          ..write('matchId: $matchId, ')
          ..write('sequenceNumber: $sequenceNumber, ')
          ..write('eventType: $eventType, ')
          ..write('payload: $payload, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlayerGlobalStatsTable extends PlayerGlobalStats
    with TableInfo<$PlayerGlobalStatsTable, PlayerGlobalStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerGlobalStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _matchesPlayedMeta = const VerificationMeta(
    'matchesPlayed',
  );
  @override
  late final GeneratedColumn<int> matchesPlayed = GeneratedColumn<int>(
    'matches_played',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalRunsMeta = const VerificationMeta(
    'totalRuns',
  );
  @override
  late final GeneratedColumn<int> totalRuns = GeneratedColumn<int>(
    'total_runs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalBallsFacedMeta = const VerificationMeta(
    'totalBallsFaced',
  );
  @override
  late final GeneratedColumn<int> totalBallsFaced = GeneratedColumn<int>(
    'total_balls_faced',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalFoursMeta = const VerificationMeta(
    'totalFours',
  );
  @override
  late final GeneratedColumn<int> totalFours = GeneratedColumn<int>(
    'total_fours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalSixesMeta = const VerificationMeta(
    'totalSixes',
  );
  @override
  late final GeneratedColumn<int> totalSixes = GeneratedColumn<int>(
    'total_sixes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalOversBowledMeta = const VerificationMeta(
    'totalOversBowled',
  );
  @override
  late final GeneratedColumn<int> totalOversBowled = GeneratedColumn<int>(
    'total_overs_bowled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalBallsBowledMeta = const VerificationMeta(
    'totalBallsBowled',
  );
  @override
  late final GeneratedColumn<int> totalBallsBowled = GeneratedColumn<int>(
    'total_balls_bowled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalRunsConcededMeta = const VerificationMeta(
    'totalRunsConceded',
  );
  @override
  late final GeneratedColumn<int> totalRunsConceded = GeneratedColumn<int>(
    'total_runs_conceded',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalWicketsTakenMeta = const VerificationMeta(
    'totalWicketsTaken',
  );
  @override
  late final GeneratedColumn<int> totalWicketsTaken = GeneratedColumn<int>(
    'total_wickets_taken',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _highestScoreMeta = const VerificationMeta(
    'highestScore',
  );
  @override
  late final GeneratedColumn<int> highestScore = GeneratedColumn<int>(
    'highest_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bestBowlingWicketsMeta =
      const VerificationMeta('bestBowlingWickets');
  @override
  late final GeneratedColumn<int> bestBowlingWickets = GeneratedColumn<int>(
    'best_bowling_wickets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bestBowlingRunsMeta = const VerificationMeta(
    'bestBowlingRuns',
  );
  @override
  late final GeneratedColumn<int> bestBowlingRuns = GeneratedColumn<int>(
    'best_bowling_runs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    playerId,
    name,
    matchesPlayed,
    totalRuns,
    totalBallsFaced,
    totalFours,
    totalSixes,
    totalOversBowled,
    totalBallsBowled,
    totalRunsConceded,
    totalWicketsTaken,
    highestScore,
    bestBowlingWickets,
    bestBowlingRuns,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_global_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerGlobalStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('matches_played')) {
      context.handle(
        _matchesPlayedMeta,
        matchesPlayed.isAcceptableOrUnknown(
          data['matches_played']!,
          _matchesPlayedMeta,
        ),
      );
    }
    if (data.containsKey('total_runs')) {
      context.handle(
        _totalRunsMeta,
        totalRuns.isAcceptableOrUnknown(data['total_runs']!, _totalRunsMeta),
      );
    }
    if (data.containsKey('total_balls_faced')) {
      context.handle(
        _totalBallsFacedMeta,
        totalBallsFaced.isAcceptableOrUnknown(
          data['total_balls_faced']!,
          _totalBallsFacedMeta,
        ),
      );
    }
    if (data.containsKey('total_fours')) {
      context.handle(
        _totalFoursMeta,
        totalFours.isAcceptableOrUnknown(data['total_fours']!, _totalFoursMeta),
      );
    }
    if (data.containsKey('total_sixes')) {
      context.handle(
        _totalSixesMeta,
        totalSixes.isAcceptableOrUnknown(data['total_sixes']!, _totalSixesMeta),
      );
    }
    if (data.containsKey('total_overs_bowled')) {
      context.handle(
        _totalOversBowledMeta,
        totalOversBowled.isAcceptableOrUnknown(
          data['total_overs_bowled']!,
          _totalOversBowledMeta,
        ),
      );
    }
    if (data.containsKey('total_balls_bowled')) {
      context.handle(
        _totalBallsBowledMeta,
        totalBallsBowled.isAcceptableOrUnknown(
          data['total_balls_bowled']!,
          _totalBallsBowledMeta,
        ),
      );
    }
    if (data.containsKey('total_runs_conceded')) {
      context.handle(
        _totalRunsConcededMeta,
        totalRunsConceded.isAcceptableOrUnknown(
          data['total_runs_conceded']!,
          _totalRunsConcededMeta,
        ),
      );
    }
    if (data.containsKey('total_wickets_taken')) {
      context.handle(
        _totalWicketsTakenMeta,
        totalWicketsTaken.isAcceptableOrUnknown(
          data['total_wickets_taken']!,
          _totalWicketsTakenMeta,
        ),
      );
    }
    if (data.containsKey('highest_score')) {
      context.handle(
        _highestScoreMeta,
        highestScore.isAcceptableOrUnknown(
          data['highest_score']!,
          _highestScoreMeta,
        ),
      );
    }
    if (data.containsKey('best_bowling_wickets')) {
      context.handle(
        _bestBowlingWicketsMeta,
        bestBowlingWickets.isAcceptableOrUnknown(
          data['best_bowling_wickets']!,
          _bestBowlingWicketsMeta,
        ),
      );
    }
    if (data.containsKey('best_bowling_runs')) {
      context.handle(
        _bestBowlingRunsMeta,
        bestBowlingRuns.isAcceptableOrUnknown(
          data['best_bowling_runs']!,
          _bestBowlingRunsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playerId};
  @override
  PlayerGlobalStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerGlobalStat(
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      matchesPlayed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}matches_played'],
      )!,
      totalRuns: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_runs'],
      )!,
      totalBallsFaced: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_balls_faced'],
      )!,
      totalFours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_fours'],
      )!,
      totalSixes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sixes'],
      )!,
      totalOversBowled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_overs_bowled'],
      )!,
      totalBallsBowled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_balls_bowled'],
      )!,
      totalRunsConceded: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_runs_conceded'],
      )!,
      totalWicketsTaken: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_wickets_taken'],
      )!,
      highestScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}highest_score'],
      )!,
      bestBowlingWickets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_bowling_wickets'],
      )!,
      bestBowlingRuns: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}best_bowling_runs'],
      )!,
    );
  }

  @override
  $PlayerGlobalStatsTable createAlias(String alias) {
    return $PlayerGlobalStatsTable(attachedDatabase, alias);
  }
}

class PlayerGlobalStat extends DataClass
    implements Insertable<PlayerGlobalStat> {
  final String playerId;
  final String name;
  final int matchesPlayed;
  final int totalRuns;
  final int totalBallsFaced;
  final int totalFours;
  final int totalSixes;
  final int totalOversBowled;
  final int totalBallsBowled;
  final int totalRunsConceded;
  final int totalWicketsTaken;
  final int highestScore;
  final int bestBowlingWickets;
  final int bestBowlingRuns;
  const PlayerGlobalStat({
    required this.playerId,
    required this.name,
    required this.matchesPlayed,
    required this.totalRuns,
    required this.totalBallsFaced,
    required this.totalFours,
    required this.totalSixes,
    required this.totalOversBowled,
    required this.totalBallsBowled,
    required this.totalRunsConceded,
    required this.totalWicketsTaken,
    required this.highestScore,
    required this.bestBowlingWickets,
    required this.bestBowlingRuns,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['player_id'] = Variable<String>(playerId);
    map['name'] = Variable<String>(name);
    map['matches_played'] = Variable<int>(matchesPlayed);
    map['total_runs'] = Variable<int>(totalRuns);
    map['total_balls_faced'] = Variable<int>(totalBallsFaced);
    map['total_fours'] = Variable<int>(totalFours);
    map['total_sixes'] = Variable<int>(totalSixes);
    map['total_overs_bowled'] = Variable<int>(totalOversBowled);
    map['total_balls_bowled'] = Variable<int>(totalBallsBowled);
    map['total_runs_conceded'] = Variable<int>(totalRunsConceded);
    map['total_wickets_taken'] = Variable<int>(totalWicketsTaken);
    map['highest_score'] = Variable<int>(highestScore);
    map['best_bowling_wickets'] = Variable<int>(bestBowlingWickets);
    map['best_bowling_runs'] = Variable<int>(bestBowlingRuns);
    return map;
  }

  PlayerGlobalStatsCompanion toCompanion(bool nullToAbsent) {
    return PlayerGlobalStatsCompanion(
      playerId: Value(playerId),
      name: Value(name),
      matchesPlayed: Value(matchesPlayed),
      totalRuns: Value(totalRuns),
      totalBallsFaced: Value(totalBallsFaced),
      totalFours: Value(totalFours),
      totalSixes: Value(totalSixes),
      totalOversBowled: Value(totalOversBowled),
      totalBallsBowled: Value(totalBallsBowled),
      totalRunsConceded: Value(totalRunsConceded),
      totalWicketsTaken: Value(totalWicketsTaken),
      highestScore: Value(highestScore),
      bestBowlingWickets: Value(bestBowlingWickets),
      bestBowlingRuns: Value(bestBowlingRuns),
    );
  }

  factory PlayerGlobalStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerGlobalStat(
      playerId: serializer.fromJson<String>(json['playerId']),
      name: serializer.fromJson<String>(json['name']),
      matchesPlayed: serializer.fromJson<int>(json['matchesPlayed']),
      totalRuns: serializer.fromJson<int>(json['totalRuns']),
      totalBallsFaced: serializer.fromJson<int>(json['totalBallsFaced']),
      totalFours: serializer.fromJson<int>(json['totalFours']),
      totalSixes: serializer.fromJson<int>(json['totalSixes']),
      totalOversBowled: serializer.fromJson<int>(json['totalOversBowled']),
      totalBallsBowled: serializer.fromJson<int>(json['totalBallsBowled']),
      totalRunsConceded: serializer.fromJson<int>(json['totalRunsConceded']),
      totalWicketsTaken: serializer.fromJson<int>(json['totalWicketsTaken']),
      highestScore: serializer.fromJson<int>(json['highestScore']),
      bestBowlingWickets: serializer.fromJson<int>(json['bestBowlingWickets']),
      bestBowlingRuns: serializer.fromJson<int>(json['bestBowlingRuns']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playerId': serializer.toJson<String>(playerId),
      'name': serializer.toJson<String>(name),
      'matchesPlayed': serializer.toJson<int>(matchesPlayed),
      'totalRuns': serializer.toJson<int>(totalRuns),
      'totalBallsFaced': serializer.toJson<int>(totalBallsFaced),
      'totalFours': serializer.toJson<int>(totalFours),
      'totalSixes': serializer.toJson<int>(totalSixes),
      'totalOversBowled': serializer.toJson<int>(totalOversBowled),
      'totalBallsBowled': serializer.toJson<int>(totalBallsBowled),
      'totalRunsConceded': serializer.toJson<int>(totalRunsConceded),
      'totalWicketsTaken': serializer.toJson<int>(totalWicketsTaken),
      'highestScore': serializer.toJson<int>(highestScore),
      'bestBowlingWickets': serializer.toJson<int>(bestBowlingWickets),
      'bestBowlingRuns': serializer.toJson<int>(bestBowlingRuns),
    };
  }

  PlayerGlobalStat copyWith({
    String? playerId,
    String? name,
    int? matchesPlayed,
    int? totalRuns,
    int? totalBallsFaced,
    int? totalFours,
    int? totalSixes,
    int? totalOversBowled,
    int? totalBallsBowled,
    int? totalRunsConceded,
    int? totalWicketsTaken,
    int? highestScore,
    int? bestBowlingWickets,
    int? bestBowlingRuns,
  }) => PlayerGlobalStat(
    playerId: playerId ?? this.playerId,
    name: name ?? this.name,
    matchesPlayed: matchesPlayed ?? this.matchesPlayed,
    totalRuns: totalRuns ?? this.totalRuns,
    totalBallsFaced: totalBallsFaced ?? this.totalBallsFaced,
    totalFours: totalFours ?? this.totalFours,
    totalSixes: totalSixes ?? this.totalSixes,
    totalOversBowled: totalOversBowled ?? this.totalOversBowled,
    totalBallsBowled: totalBallsBowled ?? this.totalBallsBowled,
    totalRunsConceded: totalRunsConceded ?? this.totalRunsConceded,
    totalWicketsTaken: totalWicketsTaken ?? this.totalWicketsTaken,
    highestScore: highestScore ?? this.highestScore,
    bestBowlingWickets: bestBowlingWickets ?? this.bestBowlingWickets,
    bestBowlingRuns: bestBowlingRuns ?? this.bestBowlingRuns,
  );
  PlayerGlobalStat copyWithCompanion(PlayerGlobalStatsCompanion data) {
    return PlayerGlobalStat(
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      name: data.name.present ? data.name.value : this.name,
      matchesPlayed: data.matchesPlayed.present
          ? data.matchesPlayed.value
          : this.matchesPlayed,
      totalRuns: data.totalRuns.present ? data.totalRuns.value : this.totalRuns,
      totalBallsFaced: data.totalBallsFaced.present
          ? data.totalBallsFaced.value
          : this.totalBallsFaced,
      totalFours: data.totalFours.present
          ? data.totalFours.value
          : this.totalFours,
      totalSixes: data.totalSixes.present
          ? data.totalSixes.value
          : this.totalSixes,
      totalOversBowled: data.totalOversBowled.present
          ? data.totalOversBowled.value
          : this.totalOversBowled,
      totalBallsBowled: data.totalBallsBowled.present
          ? data.totalBallsBowled.value
          : this.totalBallsBowled,
      totalRunsConceded: data.totalRunsConceded.present
          ? data.totalRunsConceded.value
          : this.totalRunsConceded,
      totalWicketsTaken: data.totalWicketsTaken.present
          ? data.totalWicketsTaken.value
          : this.totalWicketsTaken,
      highestScore: data.highestScore.present
          ? data.highestScore.value
          : this.highestScore,
      bestBowlingWickets: data.bestBowlingWickets.present
          ? data.bestBowlingWickets.value
          : this.bestBowlingWickets,
      bestBowlingRuns: data.bestBowlingRuns.present
          ? data.bestBowlingRuns.value
          : this.bestBowlingRuns,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerGlobalStat(')
          ..write('playerId: $playerId, ')
          ..write('name: $name, ')
          ..write('matchesPlayed: $matchesPlayed, ')
          ..write('totalRuns: $totalRuns, ')
          ..write('totalBallsFaced: $totalBallsFaced, ')
          ..write('totalFours: $totalFours, ')
          ..write('totalSixes: $totalSixes, ')
          ..write('totalOversBowled: $totalOversBowled, ')
          ..write('totalBallsBowled: $totalBallsBowled, ')
          ..write('totalRunsConceded: $totalRunsConceded, ')
          ..write('totalWicketsTaken: $totalWicketsTaken, ')
          ..write('highestScore: $highestScore, ')
          ..write('bestBowlingWickets: $bestBowlingWickets, ')
          ..write('bestBowlingRuns: $bestBowlingRuns')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    playerId,
    name,
    matchesPlayed,
    totalRuns,
    totalBallsFaced,
    totalFours,
    totalSixes,
    totalOversBowled,
    totalBallsBowled,
    totalRunsConceded,
    totalWicketsTaken,
    highestScore,
    bestBowlingWickets,
    bestBowlingRuns,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerGlobalStat &&
          other.playerId == this.playerId &&
          other.name == this.name &&
          other.matchesPlayed == this.matchesPlayed &&
          other.totalRuns == this.totalRuns &&
          other.totalBallsFaced == this.totalBallsFaced &&
          other.totalFours == this.totalFours &&
          other.totalSixes == this.totalSixes &&
          other.totalOversBowled == this.totalOversBowled &&
          other.totalBallsBowled == this.totalBallsBowled &&
          other.totalRunsConceded == this.totalRunsConceded &&
          other.totalWicketsTaken == this.totalWicketsTaken &&
          other.highestScore == this.highestScore &&
          other.bestBowlingWickets == this.bestBowlingWickets &&
          other.bestBowlingRuns == this.bestBowlingRuns);
}

class PlayerGlobalStatsCompanion extends UpdateCompanion<PlayerGlobalStat> {
  final Value<String> playerId;
  final Value<String> name;
  final Value<int> matchesPlayed;
  final Value<int> totalRuns;
  final Value<int> totalBallsFaced;
  final Value<int> totalFours;
  final Value<int> totalSixes;
  final Value<int> totalOversBowled;
  final Value<int> totalBallsBowled;
  final Value<int> totalRunsConceded;
  final Value<int> totalWicketsTaken;
  final Value<int> highestScore;
  final Value<int> bestBowlingWickets;
  final Value<int> bestBowlingRuns;
  final Value<int> rowid;
  const PlayerGlobalStatsCompanion({
    this.playerId = const Value.absent(),
    this.name = const Value.absent(),
    this.matchesPlayed = const Value.absent(),
    this.totalRuns = const Value.absent(),
    this.totalBallsFaced = const Value.absent(),
    this.totalFours = const Value.absent(),
    this.totalSixes = const Value.absent(),
    this.totalOversBowled = const Value.absent(),
    this.totalBallsBowled = const Value.absent(),
    this.totalRunsConceded = const Value.absent(),
    this.totalWicketsTaken = const Value.absent(),
    this.highestScore = const Value.absent(),
    this.bestBowlingWickets = const Value.absent(),
    this.bestBowlingRuns = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayerGlobalStatsCompanion.insert({
    required String playerId,
    required String name,
    this.matchesPlayed = const Value.absent(),
    this.totalRuns = const Value.absent(),
    this.totalBallsFaced = const Value.absent(),
    this.totalFours = const Value.absent(),
    this.totalSixes = const Value.absent(),
    this.totalOversBowled = const Value.absent(),
    this.totalBallsBowled = const Value.absent(),
    this.totalRunsConceded = const Value.absent(),
    this.totalWicketsTaken = const Value.absent(),
    this.highestScore = const Value.absent(),
    this.bestBowlingWickets = const Value.absent(),
    this.bestBowlingRuns = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : playerId = Value(playerId),
       name = Value(name);
  static Insertable<PlayerGlobalStat> custom({
    Expression<String>? playerId,
    Expression<String>? name,
    Expression<int>? matchesPlayed,
    Expression<int>? totalRuns,
    Expression<int>? totalBallsFaced,
    Expression<int>? totalFours,
    Expression<int>? totalSixes,
    Expression<int>? totalOversBowled,
    Expression<int>? totalBallsBowled,
    Expression<int>? totalRunsConceded,
    Expression<int>? totalWicketsTaken,
    Expression<int>? highestScore,
    Expression<int>? bestBowlingWickets,
    Expression<int>? bestBowlingRuns,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playerId != null) 'player_id': playerId,
      if (name != null) 'name': name,
      if (matchesPlayed != null) 'matches_played': matchesPlayed,
      if (totalRuns != null) 'total_runs': totalRuns,
      if (totalBallsFaced != null) 'total_balls_faced': totalBallsFaced,
      if (totalFours != null) 'total_fours': totalFours,
      if (totalSixes != null) 'total_sixes': totalSixes,
      if (totalOversBowled != null) 'total_overs_bowled': totalOversBowled,
      if (totalBallsBowled != null) 'total_balls_bowled': totalBallsBowled,
      if (totalRunsConceded != null) 'total_runs_conceded': totalRunsConceded,
      if (totalWicketsTaken != null) 'total_wickets_taken': totalWicketsTaken,
      if (highestScore != null) 'highest_score': highestScore,
      if (bestBowlingWickets != null)
        'best_bowling_wickets': bestBowlingWickets,
      if (bestBowlingRuns != null) 'best_bowling_runs': bestBowlingRuns,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayerGlobalStatsCompanion copyWith({
    Value<String>? playerId,
    Value<String>? name,
    Value<int>? matchesPlayed,
    Value<int>? totalRuns,
    Value<int>? totalBallsFaced,
    Value<int>? totalFours,
    Value<int>? totalSixes,
    Value<int>? totalOversBowled,
    Value<int>? totalBallsBowled,
    Value<int>? totalRunsConceded,
    Value<int>? totalWicketsTaken,
    Value<int>? highestScore,
    Value<int>? bestBowlingWickets,
    Value<int>? bestBowlingRuns,
    Value<int>? rowid,
  }) {
    return PlayerGlobalStatsCompanion(
      playerId: playerId ?? this.playerId,
      name: name ?? this.name,
      matchesPlayed: matchesPlayed ?? this.matchesPlayed,
      totalRuns: totalRuns ?? this.totalRuns,
      totalBallsFaced: totalBallsFaced ?? this.totalBallsFaced,
      totalFours: totalFours ?? this.totalFours,
      totalSixes: totalSixes ?? this.totalSixes,
      totalOversBowled: totalOversBowled ?? this.totalOversBowled,
      totalBallsBowled: totalBallsBowled ?? this.totalBallsBowled,
      totalRunsConceded: totalRunsConceded ?? this.totalRunsConceded,
      totalWicketsTaken: totalWicketsTaken ?? this.totalWicketsTaken,
      highestScore: highestScore ?? this.highestScore,
      bestBowlingWickets: bestBowlingWickets ?? this.bestBowlingWickets,
      bestBowlingRuns: bestBowlingRuns ?? this.bestBowlingRuns,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (matchesPlayed.present) {
      map['matches_played'] = Variable<int>(matchesPlayed.value);
    }
    if (totalRuns.present) {
      map['total_runs'] = Variable<int>(totalRuns.value);
    }
    if (totalBallsFaced.present) {
      map['total_balls_faced'] = Variable<int>(totalBallsFaced.value);
    }
    if (totalFours.present) {
      map['total_fours'] = Variable<int>(totalFours.value);
    }
    if (totalSixes.present) {
      map['total_sixes'] = Variable<int>(totalSixes.value);
    }
    if (totalOversBowled.present) {
      map['total_overs_bowled'] = Variable<int>(totalOversBowled.value);
    }
    if (totalBallsBowled.present) {
      map['total_balls_bowled'] = Variable<int>(totalBallsBowled.value);
    }
    if (totalRunsConceded.present) {
      map['total_runs_conceded'] = Variable<int>(totalRunsConceded.value);
    }
    if (totalWicketsTaken.present) {
      map['total_wickets_taken'] = Variable<int>(totalWicketsTaken.value);
    }
    if (highestScore.present) {
      map['highest_score'] = Variable<int>(highestScore.value);
    }
    if (bestBowlingWickets.present) {
      map['best_bowling_wickets'] = Variable<int>(bestBowlingWickets.value);
    }
    if (bestBowlingRuns.present) {
      map['best_bowling_runs'] = Variable<int>(bestBowlingRuns.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerGlobalStatsCompanion(')
          ..write('playerId: $playerId, ')
          ..write('name: $name, ')
          ..write('matchesPlayed: $matchesPlayed, ')
          ..write('totalRuns: $totalRuns, ')
          ..write('totalBallsFaced: $totalBallsFaced, ')
          ..write('totalFours: $totalFours, ')
          ..write('totalSixes: $totalSixes, ')
          ..write('totalOversBowled: $totalOversBowled, ')
          ..write('totalBallsBowled: $totalBallsBowled, ')
          ..write('totalRunsConceded: $totalRunsConceded, ')
          ..write('totalWicketsTaken: $totalWicketsTaken, ')
          ..write('highestScore: $highestScore, ')
          ..write('bestBowlingWickets: $bestBowlingWickets, ')
          ..write('bestBowlingRuns: $bestBowlingRuns, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MatchesTable matches = $MatchesTable(this);
  late final $MatchEventsTable matchEvents = $MatchEventsTable(this);
  late final $PlayerGlobalStatsTable playerGlobalStats =
      $PlayerGlobalStatsTable(this);
  late final Index idxMatchEventsMatchSeq = Index(
    'idx_match_events_match_seq',
    'CREATE INDEX idx_match_events_match_seq ON match_events (match_id, sequence_number)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    matches,
    matchEvents,
    playerGlobalStats,
    idxMatchEventsMatchSeq,
  ];
}

typedef $$MatchesTableCreateCompanionBuilder =
    MatchesCompanion Function({
      required String id,
      required String config,
      required String status,
      Value<int> currentSequenceIndex,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MatchesTableUpdateCompanionBuilder =
    MatchesCompanion Function({
      Value<String> id,
      Value<String> config,
      Value<String> status,
      Value<int> currentSequenceIndex,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MatchesTableReferences
    extends BaseReferences<_$AppDatabase, $MatchesTable, Matche> {
  $$MatchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MatchEventsTable, List<MatchEventData>>
  _matchEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.matchEvents,
    aliasName: 'matches__id__match_events__match_id',
  );

  $$MatchEventsTableProcessedTableManager get matchEventsRefs {
    final manager = $$MatchEventsTableTableManager(
      $_db,
      $_db.matchEvents,
    ).filter((f) => f.matchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_matchEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MatchesTableFilterComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentSequenceIndex => $composableBuilder(
    column: $table.currentSequenceIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> matchEventsRefs(
    Expression<bool> Function($$MatchEventsTableFilterComposer f) f,
  ) {
    final $$MatchEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.matchEvents,
      getReferencedColumn: (t) => t.matchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchEventsTableFilterComposer(
            $db: $db,
            $table: $db.matchEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get config => $composableBuilder(
    column: $table.config,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentSequenceIndex => $composableBuilder(
    column: $table.currentSequenceIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MatchesTable> {
  $$MatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get config =>
      $composableBuilder(column: $table.config, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get currentSequenceIndex => $composableBuilder(
    column: $table.currentSequenceIndex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> matchEventsRefs<T extends Object>(
    Expression<T> Function($$MatchEventsTableAnnotationComposer a) f,
  ) {
    final $$MatchEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.matchEvents,
      getReferencedColumn: (t) => t.matchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.matchEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MatchesTable,
          Matche,
          $$MatchesTableFilterComposer,
          $$MatchesTableOrderingComposer,
          $$MatchesTableAnnotationComposer,
          $$MatchesTableCreateCompanionBuilder,
          $$MatchesTableUpdateCompanionBuilder,
          (Matche, $$MatchesTableReferences),
          Matche,
          PrefetchHooks Function({bool matchEventsRefs})
        > {
  $$MatchesTableTableManager(_$AppDatabase db, $MatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> config = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> currentSequenceIndex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MatchesCompanion(
                id: id,
                config: config,
                status: status,
                currentSequenceIndex: currentSequenceIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String config,
                required String status,
                Value<int> currentSequenceIndex = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MatchesCompanion.insert(
                id: id,
                config: config,
                status: status,
                currentSequenceIndex: currentSequenceIndex,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({matchEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (matchEventsRefs) db.matchEvents],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (matchEventsRefs)
                    await $_getPrefetchedData<
                      Matche,
                      $MatchesTable,
                      MatchEventData
                    >(
                      currentTable: table,
                      referencedTable: $$MatchesTableReferences
                          ._matchEventsRefsTable(db),
                      managerFromTypedResult: (p0) => $$MatchesTableReferences(
                        db,
                        table,
                        p0,
                      ).matchEventsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.matchId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MatchesTable,
      Matche,
      $$MatchesTableFilterComposer,
      $$MatchesTableOrderingComposer,
      $$MatchesTableAnnotationComposer,
      $$MatchesTableCreateCompanionBuilder,
      $$MatchesTableUpdateCompanionBuilder,
      (Matche, $$MatchesTableReferences),
      Matche,
      PrefetchHooks Function({bool matchEventsRefs})
    >;
typedef $$MatchEventsTableCreateCompanionBuilder =
    MatchEventsCompanion Function({
      required String id,
      required String matchId,
      required int sequenceNumber,
      required String eventType,
      required String payload,
      required DateTime timestamp,
      Value<int> rowid,
    });
typedef $$MatchEventsTableUpdateCompanionBuilder =
    MatchEventsCompanion Function({
      Value<String> id,
      Value<String> matchId,
      Value<int> sequenceNumber,
      Value<String> eventType,
      Value<String> payload,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });

final class $$MatchEventsTableReferences
    extends BaseReferences<_$AppDatabase, $MatchEventsTable, MatchEventData> {
  $$MatchEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MatchesTable _matchIdTable(_$AppDatabase db) =>
      db.matches.createAlias('match_events__match_id__matches__id');

  $$MatchesTableProcessedTableManager get matchId {
    final $_column = $_itemColumn<String>('match_id')!;

    final manager = $$MatchesTableTableManager(
      $_db,
      $_db.matches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_matchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MatchEventsTableFilterComposer
    extends Composer<_$AppDatabase, $MatchEventsTable> {
  $$MatchEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$MatchesTableFilterComposer get matchId {
    final $$MatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.matchId,
      referencedTable: $db.matches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchesTableFilterComposer(
            $db: $db,
            $table: $db.matches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $MatchEventsTable> {
  $$MatchEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$MatchesTableOrderingComposer get matchId {
    final $$MatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.matchId,
      referencedTable: $db.matches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchesTableOrderingComposer(
            $db: $db,
            $table: $db.matches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MatchEventsTable> {
  $$MatchEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sequenceNumber => $composableBuilder(
    column: $table.sequenceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$MatchesTableAnnotationComposer get matchId {
    final $$MatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.matchId,
      referencedTable: $db.matches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.matches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MatchEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MatchEventsTable,
          MatchEventData,
          $$MatchEventsTableFilterComposer,
          $$MatchEventsTableOrderingComposer,
          $$MatchEventsTableAnnotationComposer,
          $$MatchEventsTableCreateCompanionBuilder,
          $$MatchEventsTableUpdateCompanionBuilder,
          (MatchEventData, $$MatchEventsTableReferences),
          MatchEventData,
          PrefetchHooks Function({bool matchId})
        > {
  $$MatchEventsTableTableManager(_$AppDatabase db, $MatchEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MatchEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MatchEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MatchEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> matchId = const Value.absent(),
                Value<int> sequenceNumber = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MatchEventsCompanion(
                id: id,
                matchId: matchId,
                sequenceNumber: sequenceNumber,
                eventType: eventType,
                payload: payload,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String matchId,
                required int sequenceNumber,
                required String eventType,
                required String payload,
                required DateTime timestamp,
                Value<int> rowid = const Value.absent(),
              }) => MatchEventsCompanion.insert(
                id: id,
                matchId: matchId,
                sequenceNumber: sequenceNumber,
                eventType: eventType,
                payload: payload,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MatchEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({matchId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (matchId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.matchId,
                                referencedTable: $$MatchEventsTableReferences
                                    ._matchIdTable(db),
                                referencedColumn: $$MatchEventsTableReferences
                                    ._matchIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MatchEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MatchEventsTable,
      MatchEventData,
      $$MatchEventsTableFilterComposer,
      $$MatchEventsTableOrderingComposer,
      $$MatchEventsTableAnnotationComposer,
      $$MatchEventsTableCreateCompanionBuilder,
      $$MatchEventsTableUpdateCompanionBuilder,
      (MatchEventData, $$MatchEventsTableReferences),
      MatchEventData,
      PrefetchHooks Function({bool matchId})
    >;
typedef $$PlayerGlobalStatsTableCreateCompanionBuilder =
    PlayerGlobalStatsCompanion Function({
      required String playerId,
      required String name,
      Value<int> matchesPlayed,
      Value<int> totalRuns,
      Value<int> totalBallsFaced,
      Value<int> totalFours,
      Value<int> totalSixes,
      Value<int> totalOversBowled,
      Value<int> totalBallsBowled,
      Value<int> totalRunsConceded,
      Value<int> totalWicketsTaken,
      Value<int> highestScore,
      Value<int> bestBowlingWickets,
      Value<int> bestBowlingRuns,
      Value<int> rowid,
    });
typedef $$PlayerGlobalStatsTableUpdateCompanionBuilder =
    PlayerGlobalStatsCompanion Function({
      Value<String> playerId,
      Value<String> name,
      Value<int> matchesPlayed,
      Value<int> totalRuns,
      Value<int> totalBallsFaced,
      Value<int> totalFours,
      Value<int> totalSixes,
      Value<int> totalOversBowled,
      Value<int> totalBallsBowled,
      Value<int> totalRunsConceded,
      Value<int> totalWicketsTaken,
      Value<int> highestScore,
      Value<int> bestBowlingWickets,
      Value<int> bestBowlingRuns,
      Value<int> rowid,
    });

class $$PlayerGlobalStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerGlobalStatsTable> {
  $$PlayerGlobalStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get playerId => $composableBuilder(
    column: $table.playerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get matchesPlayed => $composableBuilder(
    column: $table.matchesPlayed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalRuns => $composableBuilder(
    column: $table.totalRuns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalBallsFaced => $composableBuilder(
    column: $table.totalBallsFaced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalFours => $composableBuilder(
    column: $table.totalFours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSixes => $composableBuilder(
    column: $table.totalSixes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalOversBowled => $composableBuilder(
    column: $table.totalOversBowled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalBallsBowled => $composableBuilder(
    column: $table.totalBallsBowled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalRunsConceded => $composableBuilder(
    column: $table.totalRunsConceded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalWicketsTaken => $composableBuilder(
    column: $table.totalWicketsTaken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestBowlingWickets => $composableBuilder(
    column: $table.bestBowlingWickets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bestBowlingRuns => $composableBuilder(
    column: $table.bestBowlingRuns,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayerGlobalStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerGlobalStatsTable> {
  $$PlayerGlobalStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get playerId => $composableBuilder(
    column: $table.playerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get matchesPlayed => $composableBuilder(
    column: $table.matchesPlayed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalRuns => $composableBuilder(
    column: $table.totalRuns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalBallsFaced => $composableBuilder(
    column: $table.totalBallsFaced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalFours => $composableBuilder(
    column: $table.totalFours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSixes => $composableBuilder(
    column: $table.totalSixes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalOversBowled => $composableBuilder(
    column: $table.totalOversBowled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalBallsBowled => $composableBuilder(
    column: $table.totalBallsBowled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalRunsConceded => $composableBuilder(
    column: $table.totalRunsConceded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalWicketsTaken => $composableBuilder(
    column: $table.totalWicketsTaken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestBowlingWickets => $composableBuilder(
    column: $table.bestBowlingWickets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bestBowlingRuns => $composableBuilder(
    column: $table.bestBowlingRuns,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayerGlobalStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerGlobalStatsTable> {
  $$PlayerGlobalStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get playerId =>
      $composableBuilder(column: $table.playerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get matchesPlayed => $composableBuilder(
    column: $table.matchesPlayed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalRuns =>
      $composableBuilder(column: $table.totalRuns, builder: (column) => column);

  GeneratedColumn<int> get totalBallsFaced => $composableBuilder(
    column: $table.totalBallsFaced,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalFours => $composableBuilder(
    column: $table.totalFours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSixes => $composableBuilder(
    column: $table.totalSixes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalOversBowled => $composableBuilder(
    column: $table.totalOversBowled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalBallsBowled => $composableBuilder(
    column: $table.totalBallsBowled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalRunsConceded => $composableBuilder(
    column: $table.totalRunsConceded,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalWicketsTaken => $composableBuilder(
    column: $table.totalWicketsTaken,
    builder: (column) => column,
  );

  GeneratedColumn<int> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bestBowlingWickets => $composableBuilder(
    column: $table.bestBowlingWickets,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bestBowlingRuns => $composableBuilder(
    column: $table.bestBowlingRuns,
    builder: (column) => column,
  );
}

class $$PlayerGlobalStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerGlobalStatsTable,
          PlayerGlobalStat,
          $$PlayerGlobalStatsTableFilterComposer,
          $$PlayerGlobalStatsTableOrderingComposer,
          $$PlayerGlobalStatsTableAnnotationComposer,
          $$PlayerGlobalStatsTableCreateCompanionBuilder,
          $$PlayerGlobalStatsTableUpdateCompanionBuilder,
          (
            PlayerGlobalStat,
            BaseReferences<
              _$AppDatabase,
              $PlayerGlobalStatsTable,
              PlayerGlobalStat
            >,
          ),
          PlayerGlobalStat,
          PrefetchHooks Function()
        > {
  $$PlayerGlobalStatsTableTableManager(
    _$AppDatabase db,
    $PlayerGlobalStatsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerGlobalStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerGlobalStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerGlobalStatsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> playerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> matchesPlayed = const Value.absent(),
                Value<int> totalRuns = const Value.absent(),
                Value<int> totalBallsFaced = const Value.absent(),
                Value<int> totalFours = const Value.absent(),
                Value<int> totalSixes = const Value.absent(),
                Value<int> totalOversBowled = const Value.absent(),
                Value<int> totalBallsBowled = const Value.absent(),
                Value<int> totalRunsConceded = const Value.absent(),
                Value<int> totalWicketsTaken = const Value.absent(),
                Value<int> highestScore = const Value.absent(),
                Value<int> bestBowlingWickets = const Value.absent(),
                Value<int> bestBowlingRuns = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlayerGlobalStatsCompanion(
                playerId: playerId,
                name: name,
                matchesPlayed: matchesPlayed,
                totalRuns: totalRuns,
                totalBallsFaced: totalBallsFaced,
                totalFours: totalFours,
                totalSixes: totalSixes,
                totalOversBowled: totalOversBowled,
                totalBallsBowled: totalBallsBowled,
                totalRunsConceded: totalRunsConceded,
                totalWicketsTaken: totalWicketsTaken,
                highestScore: highestScore,
                bestBowlingWickets: bestBowlingWickets,
                bestBowlingRuns: bestBowlingRuns,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String playerId,
                required String name,
                Value<int> matchesPlayed = const Value.absent(),
                Value<int> totalRuns = const Value.absent(),
                Value<int> totalBallsFaced = const Value.absent(),
                Value<int> totalFours = const Value.absent(),
                Value<int> totalSixes = const Value.absent(),
                Value<int> totalOversBowled = const Value.absent(),
                Value<int> totalBallsBowled = const Value.absent(),
                Value<int> totalRunsConceded = const Value.absent(),
                Value<int> totalWicketsTaken = const Value.absent(),
                Value<int> highestScore = const Value.absent(),
                Value<int> bestBowlingWickets = const Value.absent(),
                Value<int> bestBowlingRuns = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlayerGlobalStatsCompanion.insert(
                playerId: playerId,
                name: name,
                matchesPlayed: matchesPlayed,
                totalRuns: totalRuns,
                totalBallsFaced: totalBallsFaced,
                totalFours: totalFours,
                totalSixes: totalSixes,
                totalOversBowled: totalOversBowled,
                totalBallsBowled: totalBallsBowled,
                totalRunsConceded: totalRunsConceded,
                totalWicketsTaken: totalWicketsTaken,
                highestScore: highestScore,
                bestBowlingWickets: bestBowlingWickets,
                bestBowlingRuns: bestBowlingRuns,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayerGlobalStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerGlobalStatsTable,
      PlayerGlobalStat,
      $$PlayerGlobalStatsTableFilterComposer,
      $$PlayerGlobalStatsTableOrderingComposer,
      $$PlayerGlobalStatsTableAnnotationComposer,
      $$PlayerGlobalStatsTableCreateCompanionBuilder,
      $$PlayerGlobalStatsTableUpdateCompanionBuilder,
      (
        PlayerGlobalStat,
        BaseReferences<
          _$AppDatabase,
          $PlayerGlobalStatsTable,
          PlayerGlobalStat
        >,
      ),
      PlayerGlobalStat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MatchesTableTableManager get matches =>
      $$MatchesTableTableManager(_db, _db.matches);
  $$MatchEventsTableTableManager get matchEvents =>
      $$MatchEventsTableTableManager(_db, _db.matchEvents);
  $$PlayerGlobalStatsTableTableManager get playerGlobalStats =>
      $$PlayerGlobalStatsTableTableManager(_db, _db.playerGlobalStats);
}
