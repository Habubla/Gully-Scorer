// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MatchEvent _$MatchEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'matchStarted':
          return MatchStartedEvent.fromJson(
            json
          );
                case 'deliveryRecorded':
          return DeliveryRecordedEvent.fromJson(
            json
          );
                case 'playerAdded':
          return PlayerAddedEvent.fromJson(
            json
          );
                case 'batterSelected':
          return BatterSelectedEvent.fromJson(
            json
          );
                case 'bowlerSelected':
          return BowlerSelectedEvent.fromJson(
            json
          );
                case 'inningsStarted':
          return InningsStartedEvent.fromJson(
            json
          );
                case 'overCompleted':
          return OverCompletedEvent.fromJson(
            json
          );
                case 'sessionEnded':
          return SessionEndedEvent.fromJson(
            json
          );
                case 'playerRenamed':
          return PlayerRenamedEvent.fromJson(
            json
          );
                case 'inningsCompleted':
          return InningsCompletedEvent.fromJson(
            json
          );
                case 'inningsDeclared':
          return InningsDeclaredEvent.fromJson(
            json
          );
                case 'matchCompleted':
          return MatchCompletedEvent.fromJson(
            json
          );
                case 'superOverStarted':
          return SuperOverStartedEvent.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MatchEvent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MatchEvent {

 String get matchId; DateTime get timestamp;
/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchEventCopyWith<MatchEvent> get copyWith => _$MatchEventCopyWithImpl<MatchEvent>(this as MatchEvent, _$identity);

  /// Serializes this MatchEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,timestamp);

@override
String toString() {
  return 'MatchEvent(matchId: $matchId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $MatchEventCopyWith<$Res>  {
  factory $MatchEventCopyWith(MatchEvent value, $Res Function(MatchEvent) _then) = _$MatchEventCopyWithImpl;
@useResult
$Res call({
 String matchId, DateTime timestamp
});




}
/// @nodoc
class _$MatchEventCopyWithImpl<$Res>
    implements $MatchEventCopyWith<$Res> {
  _$MatchEventCopyWithImpl(this._self, this._then);

  final MatchEvent _self;
  final $Res Function(MatchEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchEvent].
extension MatchEventPatterns on MatchEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchStartedEvent value)?  matchStarted,TResult Function( DeliveryRecordedEvent value)?  deliveryRecorded,TResult Function( PlayerAddedEvent value)?  playerAdded,TResult Function( BatterSelectedEvent value)?  batterSelected,TResult Function( BowlerSelectedEvent value)?  bowlerSelected,TResult Function( InningsStartedEvent value)?  inningsStarted,TResult Function( OverCompletedEvent value)?  overCompleted,TResult Function( SessionEndedEvent value)?  sessionEnded,TResult Function( PlayerRenamedEvent value)?  playerRenamed,TResult Function( InningsCompletedEvent value)?  inningsCompleted,TResult Function( InningsDeclaredEvent value)?  inningsDeclared,TResult Function( MatchCompletedEvent value)?  matchCompleted,TResult Function( SuperOverStartedEvent value)?  superOverStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchStartedEvent() when matchStarted != null:
return matchStarted(_that);case DeliveryRecordedEvent() when deliveryRecorded != null:
return deliveryRecorded(_that);case PlayerAddedEvent() when playerAdded != null:
return playerAdded(_that);case BatterSelectedEvent() when batterSelected != null:
return batterSelected(_that);case BowlerSelectedEvent() when bowlerSelected != null:
return bowlerSelected(_that);case InningsStartedEvent() when inningsStarted != null:
return inningsStarted(_that);case OverCompletedEvent() when overCompleted != null:
return overCompleted(_that);case SessionEndedEvent() when sessionEnded != null:
return sessionEnded(_that);case PlayerRenamedEvent() when playerRenamed != null:
return playerRenamed(_that);case InningsCompletedEvent() when inningsCompleted != null:
return inningsCompleted(_that);case InningsDeclaredEvent() when inningsDeclared != null:
return inningsDeclared(_that);case MatchCompletedEvent() when matchCompleted != null:
return matchCompleted(_that);case SuperOverStartedEvent() when superOverStarted != null:
return superOverStarted(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchStartedEvent value)  matchStarted,required TResult Function( DeliveryRecordedEvent value)  deliveryRecorded,required TResult Function( PlayerAddedEvent value)  playerAdded,required TResult Function( BatterSelectedEvent value)  batterSelected,required TResult Function( BowlerSelectedEvent value)  bowlerSelected,required TResult Function( InningsStartedEvent value)  inningsStarted,required TResult Function( OverCompletedEvent value)  overCompleted,required TResult Function( SessionEndedEvent value)  sessionEnded,required TResult Function( PlayerRenamedEvent value)  playerRenamed,required TResult Function( InningsCompletedEvent value)  inningsCompleted,required TResult Function( InningsDeclaredEvent value)  inningsDeclared,required TResult Function( MatchCompletedEvent value)  matchCompleted,required TResult Function( SuperOverStartedEvent value)  superOverStarted,}){
final _that = this;
switch (_that) {
case MatchStartedEvent():
return matchStarted(_that);case DeliveryRecordedEvent():
return deliveryRecorded(_that);case PlayerAddedEvent():
return playerAdded(_that);case BatterSelectedEvent():
return batterSelected(_that);case BowlerSelectedEvent():
return bowlerSelected(_that);case InningsStartedEvent():
return inningsStarted(_that);case OverCompletedEvent():
return overCompleted(_that);case SessionEndedEvent():
return sessionEnded(_that);case PlayerRenamedEvent():
return playerRenamed(_that);case InningsCompletedEvent():
return inningsCompleted(_that);case InningsDeclaredEvent():
return inningsDeclared(_that);case MatchCompletedEvent():
return matchCompleted(_that);case SuperOverStartedEvent():
return superOverStarted(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchStartedEvent value)?  matchStarted,TResult? Function( DeliveryRecordedEvent value)?  deliveryRecorded,TResult? Function( PlayerAddedEvent value)?  playerAdded,TResult? Function( BatterSelectedEvent value)?  batterSelected,TResult? Function( BowlerSelectedEvent value)?  bowlerSelected,TResult? Function( InningsStartedEvent value)?  inningsStarted,TResult? Function( OverCompletedEvent value)?  overCompleted,TResult? Function( SessionEndedEvent value)?  sessionEnded,TResult? Function( PlayerRenamedEvent value)?  playerRenamed,TResult? Function( InningsCompletedEvent value)?  inningsCompleted,TResult? Function( InningsDeclaredEvent value)?  inningsDeclared,TResult? Function( MatchCompletedEvent value)?  matchCompleted,TResult? Function( SuperOverStartedEvent value)?  superOverStarted,}){
final _that = this;
switch (_that) {
case MatchStartedEvent() when matchStarted != null:
return matchStarted(_that);case DeliveryRecordedEvent() when deliveryRecorded != null:
return deliveryRecorded(_that);case PlayerAddedEvent() when playerAdded != null:
return playerAdded(_that);case BatterSelectedEvent() when batterSelected != null:
return batterSelected(_that);case BowlerSelectedEvent() when bowlerSelected != null:
return bowlerSelected(_that);case InningsStartedEvent() when inningsStarted != null:
return inningsStarted(_that);case OverCompletedEvent() when overCompleted != null:
return overCompleted(_that);case SessionEndedEvent() when sessionEnded != null:
return sessionEnded(_that);case PlayerRenamedEvent() when playerRenamed != null:
return playerRenamed(_that);case InningsCompletedEvent() when inningsCompleted != null:
return inningsCompleted(_that);case InningsDeclaredEvent() when inningsDeclared != null:
return inningsDeclared(_that);case MatchCompletedEvent() when matchCompleted != null:
return matchCompleted(_that);case SuperOverStartedEvent() when superOverStarted != null:
return superOverStarted(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String matchId,  MatchConfiguration config,  DateTime timestamp,  String tossWinner,  String tossDecision)?  matchStarted,TResult Function( String matchId,  String bowlerId,  String strikerId,  String? nonStrikerId,  int runsOffBat,  List<ExtraType> extras,  Wicket? wicket,  DateTime timestamp)?  deliveryRecorded,TResult Function( String matchId,  String playerId,  String name,  String teamId,  DateTime timestamp)?  playerAdded,TResult Function( String matchId,  String strikerId,  String? nonStrikerId,  DateTime timestamp)?  batterSelected,TResult Function( String matchId,  String bowlerId,  DateTime timestamp)?  bowlerSelected,TResult Function( String matchId,  String battingTeamId,  DateTime timestamp)?  inningsStarted,TResult Function( String matchId,  DateTime timestamp)?  overCompleted,TResult Function( String matchId,  String sessionName,  DateTime timestamp)?  sessionEnded,TResult Function( String matchId,  String playerId,  String newName,  DateTime timestamp)?  playerRenamed,TResult Function( String matchId,  DateTime timestamp)?  inningsCompleted,TResult Function( String matchId,  DateTime timestamp)?  inningsDeclared,TResult Function( String matchId,  String result,  DateTime timestamp)?  matchCompleted,TResult Function( String matchId,  DateTime timestamp)?  superOverStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchStartedEvent() when matchStarted != null:
return matchStarted(_that.matchId,_that.config,_that.timestamp,_that.tossWinner,_that.tossDecision);case DeliveryRecordedEvent() when deliveryRecorded != null:
return deliveryRecorded(_that.matchId,_that.bowlerId,_that.strikerId,_that.nonStrikerId,_that.runsOffBat,_that.extras,_that.wicket,_that.timestamp);case PlayerAddedEvent() when playerAdded != null:
return playerAdded(_that.matchId,_that.playerId,_that.name,_that.teamId,_that.timestamp);case BatterSelectedEvent() when batterSelected != null:
return batterSelected(_that.matchId,_that.strikerId,_that.nonStrikerId,_that.timestamp);case BowlerSelectedEvent() when bowlerSelected != null:
return bowlerSelected(_that.matchId,_that.bowlerId,_that.timestamp);case InningsStartedEvent() when inningsStarted != null:
return inningsStarted(_that.matchId,_that.battingTeamId,_that.timestamp);case OverCompletedEvent() when overCompleted != null:
return overCompleted(_that.matchId,_that.timestamp);case SessionEndedEvent() when sessionEnded != null:
return sessionEnded(_that.matchId,_that.sessionName,_that.timestamp);case PlayerRenamedEvent() when playerRenamed != null:
return playerRenamed(_that.matchId,_that.playerId,_that.newName,_that.timestamp);case InningsCompletedEvent() when inningsCompleted != null:
return inningsCompleted(_that.matchId,_that.timestamp);case InningsDeclaredEvent() when inningsDeclared != null:
return inningsDeclared(_that.matchId,_that.timestamp);case MatchCompletedEvent() when matchCompleted != null:
return matchCompleted(_that.matchId,_that.result,_that.timestamp);case SuperOverStartedEvent() when superOverStarted != null:
return superOverStarted(_that.matchId,_that.timestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String matchId,  MatchConfiguration config,  DateTime timestamp,  String tossWinner,  String tossDecision)  matchStarted,required TResult Function( String matchId,  String bowlerId,  String strikerId,  String? nonStrikerId,  int runsOffBat,  List<ExtraType> extras,  Wicket? wicket,  DateTime timestamp)  deliveryRecorded,required TResult Function( String matchId,  String playerId,  String name,  String teamId,  DateTime timestamp)  playerAdded,required TResult Function( String matchId,  String strikerId,  String? nonStrikerId,  DateTime timestamp)  batterSelected,required TResult Function( String matchId,  String bowlerId,  DateTime timestamp)  bowlerSelected,required TResult Function( String matchId,  String battingTeamId,  DateTime timestamp)  inningsStarted,required TResult Function( String matchId,  DateTime timestamp)  overCompleted,required TResult Function( String matchId,  String sessionName,  DateTime timestamp)  sessionEnded,required TResult Function( String matchId,  String playerId,  String newName,  DateTime timestamp)  playerRenamed,required TResult Function( String matchId,  DateTime timestamp)  inningsCompleted,required TResult Function( String matchId,  DateTime timestamp)  inningsDeclared,required TResult Function( String matchId,  String result,  DateTime timestamp)  matchCompleted,required TResult Function( String matchId,  DateTime timestamp)  superOverStarted,}) {final _that = this;
switch (_that) {
case MatchStartedEvent():
return matchStarted(_that.matchId,_that.config,_that.timestamp,_that.tossWinner,_that.tossDecision);case DeliveryRecordedEvent():
return deliveryRecorded(_that.matchId,_that.bowlerId,_that.strikerId,_that.nonStrikerId,_that.runsOffBat,_that.extras,_that.wicket,_that.timestamp);case PlayerAddedEvent():
return playerAdded(_that.matchId,_that.playerId,_that.name,_that.teamId,_that.timestamp);case BatterSelectedEvent():
return batterSelected(_that.matchId,_that.strikerId,_that.nonStrikerId,_that.timestamp);case BowlerSelectedEvent():
return bowlerSelected(_that.matchId,_that.bowlerId,_that.timestamp);case InningsStartedEvent():
return inningsStarted(_that.matchId,_that.battingTeamId,_that.timestamp);case OverCompletedEvent():
return overCompleted(_that.matchId,_that.timestamp);case SessionEndedEvent():
return sessionEnded(_that.matchId,_that.sessionName,_that.timestamp);case PlayerRenamedEvent():
return playerRenamed(_that.matchId,_that.playerId,_that.newName,_that.timestamp);case InningsCompletedEvent():
return inningsCompleted(_that.matchId,_that.timestamp);case InningsDeclaredEvent():
return inningsDeclared(_that.matchId,_that.timestamp);case MatchCompletedEvent():
return matchCompleted(_that.matchId,_that.result,_that.timestamp);case SuperOverStartedEvent():
return superOverStarted(_that.matchId,_that.timestamp);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String matchId,  MatchConfiguration config,  DateTime timestamp,  String tossWinner,  String tossDecision)?  matchStarted,TResult? Function( String matchId,  String bowlerId,  String strikerId,  String? nonStrikerId,  int runsOffBat,  List<ExtraType> extras,  Wicket? wicket,  DateTime timestamp)?  deliveryRecorded,TResult? Function( String matchId,  String playerId,  String name,  String teamId,  DateTime timestamp)?  playerAdded,TResult? Function( String matchId,  String strikerId,  String? nonStrikerId,  DateTime timestamp)?  batterSelected,TResult? Function( String matchId,  String bowlerId,  DateTime timestamp)?  bowlerSelected,TResult? Function( String matchId,  String battingTeamId,  DateTime timestamp)?  inningsStarted,TResult? Function( String matchId,  DateTime timestamp)?  overCompleted,TResult? Function( String matchId,  String sessionName,  DateTime timestamp)?  sessionEnded,TResult? Function( String matchId,  String playerId,  String newName,  DateTime timestamp)?  playerRenamed,TResult? Function( String matchId,  DateTime timestamp)?  inningsCompleted,TResult? Function( String matchId,  DateTime timestamp)?  inningsDeclared,TResult? Function( String matchId,  String result,  DateTime timestamp)?  matchCompleted,TResult? Function( String matchId,  DateTime timestamp)?  superOverStarted,}) {final _that = this;
switch (_that) {
case MatchStartedEvent() when matchStarted != null:
return matchStarted(_that.matchId,_that.config,_that.timestamp,_that.tossWinner,_that.tossDecision);case DeliveryRecordedEvent() when deliveryRecorded != null:
return deliveryRecorded(_that.matchId,_that.bowlerId,_that.strikerId,_that.nonStrikerId,_that.runsOffBat,_that.extras,_that.wicket,_that.timestamp);case PlayerAddedEvent() when playerAdded != null:
return playerAdded(_that.matchId,_that.playerId,_that.name,_that.teamId,_that.timestamp);case BatterSelectedEvent() when batterSelected != null:
return batterSelected(_that.matchId,_that.strikerId,_that.nonStrikerId,_that.timestamp);case BowlerSelectedEvent() when bowlerSelected != null:
return bowlerSelected(_that.matchId,_that.bowlerId,_that.timestamp);case InningsStartedEvent() when inningsStarted != null:
return inningsStarted(_that.matchId,_that.battingTeamId,_that.timestamp);case OverCompletedEvent() when overCompleted != null:
return overCompleted(_that.matchId,_that.timestamp);case SessionEndedEvent() when sessionEnded != null:
return sessionEnded(_that.matchId,_that.sessionName,_that.timestamp);case PlayerRenamedEvent() when playerRenamed != null:
return playerRenamed(_that.matchId,_that.playerId,_that.newName,_that.timestamp);case InningsCompletedEvent() when inningsCompleted != null:
return inningsCompleted(_that.matchId,_that.timestamp);case InningsDeclaredEvent() when inningsDeclared != null:
return inningsDeclared(_that.matchId,_that.timestamp);case MatchCompletedEvent() when matchCompleted != null:
return matchCompleted(_that.matchId,_that.result,_that.timestamp);case SuperOverStartedEvent() when superOverStarted != null:
return superOverStarted(_that.matchId,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MatchStartedEvent implements MatchEvent {
  const MatchStartedEvent({required this.matchId, required this.config, required this.timestamp, this.tossWinner = 'Team 1', this.tossDecision = 'Bat', final  String? $type}): $type = $type ?? 'matchStarted';
  factory MatchStartedEvent.fromJson(Map<String, dynamic> json) => _$MatchStartedEventFromJson(json);

@override final  String matchId;
 final  MatchConfiguration config;
@override final  DateTime timestamp;
@JsonKey() final  String tossWinner;
@JsonKey() final  String tossDecision;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchStartedEventCopyWith<MatchStartedEvent> get copyWith => _$MatchStartedEventCopyWithImpl<MatchStartedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchStartedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchStartedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.config, config) || other.config == config)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tossWinner, tossWinner) || other.tossWinner == tossWinner)&&(identical(other.tossDecision, tossDecision) || other.tossDecision == tossDecision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,config,timestamp,tossWinner,tossDecision);

@override
String toString() {
  return 'MatchEvent.matchStarted(matchId: $matchId, config: $config, timestamp: $timestamp, tossWinner: $tossWinner, tossDecision: $tossDecision)';
}


}

/// @nodoc
abstract mixin class $MatchStartedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $MatchStartedEventCopyWith(MatchStartedEvent value, $Res Function(MatchStartedEvent) _then) = _$MatchStartedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, MatchConfiguration config, DateTime timestamp, String tossWinner, String tossDecision
});


$MatchConfigurationCopyWith<$Res> get config;

}
/// @nodoc
class _$MatchStartedEventCopyWithImpl<$Res>
    implements $MatchStartedEventCopyWith<$Res> {
  _$MatchStartedEventCopyWithImpl(this._self, this._then);

  final MatchStartedEvent _self;
  final $Res Function(MatchStartedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? config = null,Object? timestamp = null,Object? tossWinner = null,Object? tossDecision = null,}) {
  return _then(MatchStartedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as MatchConfiguration,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tossWinner: null == tossWinner ? _self.tossWinner : tossWinner // ignore: cast_nullable_to_non_nullable
as String,tossDecision: null == tossDecision ? _self.tossDecision : tossDecision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchConfigurationCopyWith<$Res> get config {
  
  return $MatchConfigurationCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DeliveryRecordedEvent implements MatchEvent {
  const DeliveryRecordedEvent({required this.matchId, required this.bowlerId, required this.strikerId, this.nonStrikerId, this.runsOffBat = 0, final  List<ExtraType> extras = const [], this.wicket, required this.timestamp, final  String? $type}): _extras = extras,$type = $type ?? 'deliveryRecorded';
  factory DeliveryRecordedEvent.fromJson(Map<String, dynamic> json) => _$DeliveryRecordedEventFromJson(json);

@override final  String matchId;
 final  String bowlerId;
 final  String strikerId;
 final  String? nonStrikerId;
@JsonKey() final  int runsOffBat;
 final  List<ExtraType> _extras;
@JsonKey() List<ExtraType> get extras {
  if (_extras is EqualUnmodifiableListView) return _extras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extras);
}

 final  Wicket? wicket;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRecordedEventCopyWith<DeliveryRecordedEvent> get copyWith => _$DeliveryRecordedEventCopyWithImpl<DeliveryRecordedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryRecordedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRecordedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.bowlerId, bowlerId) || other.bowlerId == bowlerId)&&(identical(other.strikerId, strikerId) || other.strikerId == strikerId)&&(identical(other.nonStrikerId, nonStrikerId) || other.nonStrikerId == nonStrikerId)&&(identical(other.runsOffBat, runsOffBat) || other.runsOffBat == runsOffBat)&&const DeepCollectionEquality().equals(other._extras, _extras)&&(identical(other.wicket, wicket) || other.wicket == wicket)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,bowlerId,strikerId,nonStrikerId,runsOffBat,const DeepCollectionEquality().hash(_extras),wicket,timestamp);

@override
String toString() {
  return 'MatchEvent.deliveryRecorded(matchId: $matchId, bowlerId: $bowlerId, strikerId: $strikerId, nonStrikerId: $nonStrikerId, runsOffBat: $runsOffBat, extras: $extras, wicket: $wicket, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $DeliveryRecordedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $DeliveryRecordedEventCopyWith(DeliveryRecordedEvent value, $Res Function(DeliveryRecordedEvent) _then) = _$DeliveryRecordedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String bowlerId, String strikerId, String? nonStrikerId, int runsOffBat, List<ExtraType> extras, Wicket? wicket, DateTime timestamp
});


$WicketCopyWith<$Res>? get wicket;

}
/// @nodoc
class _$DeliveryRecordedEventCopyWithImpl<$Res>
    implements $DeliveryRecordedEventCopyWith<$Res> {
  _$DeliveryRecordedEventCopyWithImpl(this._self, this._then);

  final DeliveryRecordedEvent _self;
  final $Res Function(DeliveryRecordedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? bowlerId = null,Object? strikerId = null,Object? nonStrikerId = freezed,Object? runsOffBat = null,Object? extras = null,Object? wicket = freezed,Object? timestamp = null,}) {
  return _then(DeliveryRecordedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,bowlerId: null == bowlerId ? _self.bowlerId : bowlerId // ignore: cast_nullable_to_non_nullable
as String,strikerId: null == strikerId ? _self.strikerId : strikerId // ignore: cast_nullable_to_non_nullable
as String,nonStrikerId: freezed == nonStrikerId ? _self.nonStrikerId : nonStrikerId // ignore: cast_nullable_to_non_nullable
as String?,runsOffBat: null == runsOffBat ? _self.runsOffBat : runsOffBat // ignore: cast_nullable_to_non_nullable
as int,extras: null == extras ? _self._extras : extras // ignore: cast_nullable_to_non_nullable
as List<ExtraType>,wicket: freezed == wicket ? _self.wicket : wicket // ignore: cast_nullable_to_non_nullable
as Wicket?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WicketCopyWith<$Res>? get wicket {
    if (_self.wicket == null) {
    return null;
  }

  return $WicketCopyWith<$Res>(_self.wicket!, (value) {
    return _then(_self.copyWith(wicket: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PlayerAddedEvent implements MatchEvent {
  const PlayerAddedEvent({required this.matchId, required this.playerId, required this.name, required this.teamId, required this.timestamp, final  String? $type}): $type = $type ?? 'playerAdded';
  factory PlayerAddedEvent.fromJson(Map<String, dynamic> json) => _$PlayerAddedEventFromJson(json);

@override final  String matchId;
 final  String playerId;
 final  String name;
 final  String teamId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAddedEventCopyWith<PlayerAddedEvent> get copyWith => _$PlayerAddedEventCopyWithImpl<PlayerAddedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerAddedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAddedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,playerId,name,teamId,timestamp);

@override
String toString() {
  return 'MatchEvent.playerAdded(matchId: $matchId, playerId: $playerId, name: $name, teamId: $teamId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $PlayerAddedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $PlayerAddedEventCopyWith(PlayerAddedEvent value, $Res Function(PlayerAddedEvent) _then) = _$PlayerAddedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String playerId, String name, String teamId, DateTime timestamp
});




}
/// @nodoc
class _$PlayerAddedEventCopyWithImpl<$Res>
    implements $PlayerAddedEventCopyWith<$Res> {
  _$PlayerAddedEventCopyWithImpl(this._self, this._then);

  final PlayerAddedEvent _self;
  final $Res Function(PlayerAddedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? playerId = null,Object? name = null,Object? teamId = null,Object? timestamp = null,}) {
  return _then(PlayerAddedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BatterSelectedEvent implements MatchEvent {
  const BatterSelectedEvent({required this.matchId, required this.strikerId, this.nonStrikerId, required this.timestamp, final  String? $type}): $type = $type ?? 'batterSelected';
  factory BatterSelectedEvent.fromJson(Map<String, dynamic> json) => _$BatterSelectedEventFromJson(json);

@override final  String matchId;
 final  String strikerId;
 final  String? nonStrikerId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatterSelectedEventCopyWith<BatterSelectedEvent> get copyWith => _$BatterSelectedEventCopyWithImpl<BatterSelectedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatterSelectedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatterSelectedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.strikerId, strikerId) || other.strikerId == strikerId)&&(identical(other.nonStrikerId, nonStrikerId) || other.nonStrikerId == nonStrikerId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,strikerId,nonStrikerId,timestamp);

@override
String toString() {
  return 'MatchEvent.batterSelected(matchId: $matchId, strikerId: $strikerId, nonStrikerId: $nonStrikerId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $BatterSelectedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $BatterSelectedEventCopyWith(BatterSelectedEvent value, $Res Function(BatterSelectedEvent) _then) = _$BatterSelectedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String strikerId, String? nonStrikerId, DateTime timestamp
});




}
/// @nodoc
class _$BatterSelectedEventCopyWithImpl<$Res>
    implements $BatterSelectedEventCopyWith<$Res> {
  _$BatterSelectedEventCopyWithImpl(this._self, this._then);

  final BatterSelectedEvent _self;
  final $Res Function(BatterSelectedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? strikerId = null,Object? nonStrikerId = freezed,Object? timestamp = null,}) {
  return _then(BatterSelectedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,strikerId: null == strikerId ? _self.strikerId : strikerId // ignore: cast_nullable_to_non_nullable
as String,nonStrikerId: freezed == nonStrikerId ? _self.nonStrikerId : nonStrikerId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BowlerSelectedEvent implements MatchEvent {
  const BowlerSelectedEvent({required this.matchId, required this.bowlerId, required this.timestamp, final  String? $type}): $type = $type ?? 'bowlerSelected';
  factory BowlerSelectedEvent.fromJson(Map<String, dynamic> json) => _$BowlerSelectedEventFromJson(json);

@override final  String matchId;
 final  String bowlerId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BowlerSelectedEventCopyWith<BowlerSelectedEvent> get copyWith => _$BowlerSelectedEventCopyWithImpl<BowlerSelectedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BowlerSelectedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BowlerSelectedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.bowlerId, bowlerId) || other.bowlerId == bowlerId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,bowlerId,timestamp);

@override
String toString() {
  return 'MatchEvent.bowlerSelected(matchId: $matchId, bowlerId: $bowlerId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $BowlerSelectedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $BowlerSelectedEventCopyWith(BowlerSelectedEvent value, $Res Function(BowlerSelectedEvent) _then) = _$BowlerSelectedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String bowlerId, DateTime timestamp
});




}
/// @nodoc
class _$BowlerSelectedEventCopyWithImpl<$Res>
    implements $BowlerSelectedEventCopyWith<$Res> {
  _$BowlerSelectedEventCopyWithImpl(this._self, this._then);

  final BowlerSelectedEvent _self;
  final $Res Function(BowlerSelectedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? bowlerId = null,Object? timestamp = null,}) {
  return _then(BowlerSelectedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,bowlerId: null == bowlerId ? _self.bowlerId : bowlerId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InningsStartedEvent implements MatchEvent {
  const InningsStartedEvent({required this.matchId, required this.battingTeamId, required this.timestamp, final  String? $type}): $type = $type ?? 'inningsStarted';
  factory InningsStartedEvent.fromJson(Map<String, dynamic> json) => _$InningsStartedEventFromJson(json);

@override final  String matchId;
 final  String battingTeamId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InningsStartedEventCopyWith<InningsStartedEvent> get copyWith => _$InningsStartedEventCopyWithImpl<InningsStartedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InningsStartedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InningsStartedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.battingTeamId, battingTeamId) || other.battingTeamId == battingTeamId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,battingTeamId,timestamp);

@override
String toString() {
  return 'MatchEvent.inningsStarted(matchId: $matchId, battingTeamId: $battingTeamId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $InningsStartedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $InningsStartedEventCopyWith(InningsStartedEvent value, $Res Function(InningsStartedEvent) _then) = _$InningsStartedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String battingTeamId, DateTime timestamp
});




}
/// @nodoc
class _$InningsStartedEventCopyWithImpl<$Res>
    implements $InningsStartedEventCopyWith<$Res> {
  _$InningsStartedEventCopyWithImpl(this._self, this._then);

  final InningsStartedEvent _self;
  final $Res Function(InningsStartedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? battingTeamId = null,Object? timestamp = null,}) {
  return _then(InningsStartedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,battingTeamId: null == battingTeamId ? _self.battingTeamId : battingTeamId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class OverCompletedEvent implements MatchEvent {
  const OverCompletedEvent({required this.matchId, required this.timestamp, final  String? $type}): $type = $type ?? 'overCompleted';
  factory OverCompletedEvent.fromJson(Map<String, dynamic> json) => _$OverCompletedEventFromJson(json);

@override final  String matchId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverCompletedEventCopyWith<OverCompletedEvent> get copyWith => _$OverCompletedEventCopyWithImpl<OverCompletedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverCompletedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverCompletedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,timestamp);

@override
String toString() {
  return 'MatchEvent.overCompleted(matchId: $matchId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $OverCompletedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $OverCompletedEventCopyWith(OverCompletedEvent value, $Res Function(OverCompletedEvent) _then) = _$OverCompletedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, DateTime timestamp
});




}
/// @nodoc
class _$OverCompletedEventCopyWithImpl<$Res>
    implements $OverCompletedEventCopyWith<$Res> {
  _$OverCompletedEventCopyWithImpl(this._self, this._then);

  final OverCompletedEvent _self;
  final $Res Function(OverCompletedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? timestamp = null,}) {
  return _then(OverCompletedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SessionEndedEvent implements MatchEvent {
  const SessionEndedEvent({required this.matchId, required this.sessionName, required this.timestamp, final  String? $type}): $type = $type ?? 'sessionEnded';
  factory SessionEndedEvent.fromJson(Map<String, dynamic> json) => _$SessionEndedEventFromJson(json);

@override final  String matchId;
 final  String sessionName;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEndedEventCopyWith<SessionEndedEvent> get copyWith => _$SessionEndedEventCopyWithImpl<SessionEndedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionEndedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEndedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.sessionName, sessionName) || other.sessionName == sessionName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,sessionName,timestamp);

@override
String toString() {
  return 'MatchEvent.sessionEnded(matchId: $matchId, sessionName: $sessionName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SessionEndedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $SessionEndedEventCopyWith(SessionEndedEvent value, $Res Function(SessionEndedEvent) _then) = _$SessionEndedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String sessionName, DateTime timestamp
});




}
/// @nodoc
class _$SessionEndedEventCopyWithImpl<$Res>
    implements $SessionEndedEventCopyWith<$Res> {
  _$SessionEndedEventCopyWithImpl(this._self, this._then);

  final SessionEndedEvent _self;
  final $Res Function(SessionEndedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? sessionName = null,Object? timestamp = null,}) {
  return _then(SessionEndedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,sessionName: null == sessionName ? _self.sessionName : sessionName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PlayerRenamedEvent implements MatchEvent {
  const PlayerRenamedEvent({required this.matchId, required this.playerId, required this.newName, required this.timestamp, final  String? $type}): $type = $type ?? 'playerRenamed';
  factory PlayerRenamedEvent.fromJson(Map<String, dynamic> json) => _$PlayerRenamedEventFromJson(json);

@override final  String matchId;
 final  String playerId;
 final  String newName;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerRenamedEventCopyWith<PlayerRenamedEvent> get copyWith => _$PlayerRenamedEventCopyWithImpl<PlayerRenamedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerRenamedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerRenamedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.newName, newName) || other.newName == newName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,playerId,newName,timestamp);

@override
String toString() {
  return 'MatchEvent.playerRenamed(matchId: $matchId, playerId: $playerId, newName: $newName, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $PlayerRenamedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $PlayerRenamedEventCopyWith(PlayerRenamedEvent value, $Res Function(PlayerRenamedEvent) _then) = _$PlayerRenamedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String playerId, String newName, DateTime timestamp
});




}
/// @nodoc
class _$PlayerRenamedEventCopyWithImpl<$Res>
    implements $PlayerRenamedEventCopyWith<$Res> {
  _$PlayerRenamedEventCopyWithImpl(this._self, this._then);

  final PlayerRenamedEvent _self;
  final $Res Function(PlayerRenamedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? playerId = null,Object? newName = null,Object? timestamp = null,}) {
  return _then(PlayerRenamedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,newName: null == newName ? _self.newName : newName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InningsCompletedEvent implements MatchEvent {
  const InningsCompletedEvent({required this.matchId, required this.timestamp, final  String? $type}): $type = $type ?? 'inningsCompleted';
  factory InningsCompletedEvent.fromJson(Map<String, dynamic> json) => _$InningsCompletedEventFromJson(json);

@override final  String matchId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InningsCompletedEventCopyWith<InningsCompletedEvent> get copyWith => _$InningsCompletedEventCopyWithImpl<InningsCompletedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InningsCompletedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InningsCompletedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,timestamp);

@override
String toString() {
  return 'MatchEvent.inningsCompleted(matchId: $matchId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $InningsCompletedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $InningsCompletedEventCopyWith(InningsCompletedEvent value, $Res Function(InningsCompletedEvent) _then) = _$InningsCompletedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, DateTime timestamp
});




}
/// @nodoc
class _$InningsCompletedEventCopyWithImpl<$Res>
    implements $InningsCompletedEventCopyWith<$Res> {
  _$InningsCompletedEventCopyWithImpl(this._self, this._then);

  final InningsCompletedEvent _self;
  final $Res Function(InningsCompletedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? timestamp = null,}) {
  return _then(InningsCompletedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InningsDeclaredEvent implements MatchEvent {
  const InningsDeclaredEvent({required this.matchId, required this.timestamp, final  String? $type}): $type = $type ?? 'inningsDeclared';
  factory InningsDeclaredEvent.fromJson(Map<String, dynamic> json) => _$InningsDeclaredEventFromJson(json);

@override final  String matchId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InningsDeclaredEventCopyWith<InningsDeclaredEvent> get copyWith => _$InningsDeclaredEventCopyWithImpl<InningsDeclaredEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InningsDeclaredEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InningsDeclaredEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,timestamp);

@override
String toString() {
  return 'MatchEvent.inningsDeclared(matchId: $matchId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $InningsDeclaredEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $InningsDeclaredEventCopyWith(InningsDeclaredEvent value, $Res Function(InningsDeclaredEvent) _then) = _$InningsDeclaredEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, DateTime timestamp
});




}
/// @nodoc
class _$InningsDeclaredEventCopyWithImpl<$Res>
    implements $InningsDeclaredEventCopyWith<$Res> {
  _$InningsDeclaredEventCopyWithImpl(this._self, this._then);

  final InningsDeclaredEvent _self;
  final $Res Function(InningsDeclaredEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? timestamp = null,}) {
  return _then(InningsDeclaredEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MatchCompletedEvent implements MatchEvent {
  const MatchCompletedEvent({required this.matchId, required this.result, required this.timestamp, final  String? $type}): $type = $type ?? 'matchCompleted';
  factory MatchCompletedEvent.fromJson(Map<String, dynamic> json) => _$MatchCompletedEventFromJson(json);

@override final  String matchId;
 final  String result;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchCompletedEventCopyWith<MatchCompletedEvent> get copyWith => _$MatchCompletedEventCopyWithImpl<MatchCompletedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchCompletedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchCompletedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.result, result) || other.result == result)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,result,timestamp);

@override
String toString() {
  return 'MatchEvent.matchCompleted(matchId: $matchId, result: $result, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $MatchCompletedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $MatchCompletedEventCopyWith(MatchCompletedEvent value, $Res Function(MatchCompletedEvent) _then) = _$MatchCompletedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, String result, DateTime timestamp
});




}
/// @nodoc
class _$MatchCompletedEventCopyWithImpl<$Res>
    implements $MatchCompletedEventCopyWith<$Res> {
  _$MatchCompletedEventCopyWithImpl(this._self, this._then);

  final MatchCompletedEvent _self;
  final $Res Function(MatchCompletedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? result = null,Object? timestamp = null,}) {
  return _then(MatchCompletedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SuperOverStartedEvent implements MatchEvent {
  const SuperOverStartedEvent({required this.matchId, required this.timestamp, final  String? $type}): $type = $type ?? 'superOverStarted';
  factory SuperOverStartedEvent.fromJson(Map<String, dynamic> json) => _$SuperOverStartedEventFromJson(json);

@override final  String matchId;
@override final  DateTime timestamp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuperOverStartedEventCopyWith<SuperOverStartedEvent> get copyWith => _$SuperOverStartedEventCopyWithImpl<SuperOverStartedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuperOverStartedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuperOverStartedEvent&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchId,timestamp);

@override
String toString() {
  return 'MatchEvent.superOverStarted(matchId: $matchId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SuperOverStartedEventCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $SuperOverStartedEventCopyWith(SuperOverStartedEvent value, $Res Function(SuperOverStartedEvent) _then) = _$SuperOverStartedEventCopyWithImpl;
@override @useResult
$Res call({
 String matchId, DateTime timestamp
});




}
/// @nodoc
class _$SuperOverStartedEventCopyWithImpl<$Res>
    implements $SuperOverStartedEventCopyWith<$Res> {
  _$SuperOverStartedEventCopyWithImpl(this._self, this._then);

  final SuperOverStartedEvent _self;
  final $Res Function(SuperOverStartedEvent) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? timestamp = null,}) {
  return _then(SuperOverStartedEvent(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Wicket {

 String get dismissedPlayerId; DismissalType get type; String? get fielderId;
/// Create a copy of Wicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WicketCopyWith<Wicket> get copyWith => _$WicketCopyWithImpl<Wicket>(this as Wicket, _$identity);

  /// Serializes this Wicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wicket&&(identical(other.dismissedPlayerId, dismissedPlayerId) || other.dismissedPlayerId == dismissedPlayerId)&&(identical(other.type, type) || other.type == type)&&(identical(other.fielderId, fielderId) || other.fielderId == fielderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dismissedPlayerId,type,fielderId);

@override
String toString() {
  return 'Wicket(dismissedPlayerId: $dismissedPlayerId, type: $type, fielderId: $fielderId)';
}


}

/// @nodoc
abstract mixin class $WicketCopyWith<$Res>  {
  factory $WicketCopyWith(Wicket value, $Res Function(Wicket) _then) = _$WicketCopyWithImpl;
@useResult
$Res call({
 String dismissedPlayerId, DismissalType type, String? fielderId
});




}
/// @nodoc
class _$WicketCopyWithImpl<$Res>
    implements $WicketCopyWith<$Res> {
  _$WicketCopyWithImpl(this._self, this._then);

  final Wicket _self;
  final $Res Function(Wicket) _then;

/// Create a copy of Wicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dismissedPlayerId = null,Object? type = null,Object? fielderId = freezed,}) {
  return _then(_self.copyWith(
dismissedPlayerId: null == dismissedPlayerId ? _self.dismissedPlayerId : dismissedPlayerId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DismissalType,fielderId: freezed == fielderId ? _self.fielderId : fielderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Wicket].
extension WicketPatterns on Wicket {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wicket() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wicket value)  $default,){
final _that = this;
switch (_that) {
case _Wicket():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wicket value)?  $default,){
final _that = this;
switch (_that) {
case _Wicket() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dismissedPlayerId,  DismissalType type,  String? fielderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wicket() when $default != null:
return $default(_that.dismissedPlayerId,_that.type,_that.fielderId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dismissedPlayerId,  DismissalType type,  String? fielderId)  $default,) {final _that = this;
switch (_that) {
case _Wicket():
return $default(_that.dismissedPlayerId,_that.type,_that.fielderId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dismissedPlayerId,  DismissalType type,  String? fielderId)?  $default,) {final _that = this;
switch (_that) {
case _Wicket() when $default != null:
return $default(_that.dismissedPlayerId,_that.type,_that.fielderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Wicket implements Wicket {
  const _Wicket({required this.dismissedPlayerId, required this.type, this.fielderId});
  factory _Wicket.fromJson(Map<String, dynamic> json) => _$WicketFromJson(json);

@override final  String dismissedPlayerId;
@override final  DismissalType type;
@override final  String? fielderId;

/// Create a copy of Wicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WicketCopyWith<_Wicket> get copyWith => __$WicketCopyWithImpl<_Wicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wicket&&(identical(other.dismissedPlayerId, dismissedPlayerId) || other.dismissedPlayerId == dismissedPlayerId)&&(identical(other.type, type) || other.type == type)&&(identical(other.fielderId, fielderId) || other.fielderId == fielderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dismissedPlayerId,type,fielderId);

@override
String toString() {
  return 'Wicket(dismissedPlayerId: $dismissedPlayerId, type: $type, fielderId: $fielderId)';
}


}

/// @nodoc
abstract mixin class _$WicketCopyWith<$Res> implements $WicketCopyWith<$Res> {
  factory _$WicketCopyWith(_Wicket value, $Res Function(_Wicket) _then) = __$WicketCopyWithImpl;
@override @useResult
$Res call({
 String dismissedPlayerId, DismissalType type, String? fielderId
});




}
/// @nodoc
class __$WicketCopyWithImpl<$Res>
    implements _$WicketCopyWith<$Res> {
  __$WicketCopyWithImpl(this._self, this._then);

  final _Wicket _self;
  final $Res Function(_Wicket) _then;

/// Create a copy of Wicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dismissedPlayerId = null,Object? type = null,Object? fielderId = freezed,}) {
  return _then(_Wicket(
dismissedPlayerId: null == dismissedPlayerId ? _self.dismissedPlayerId : dismissedPlayerId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DismissalType,fielderId: freezed == fielderId ? _self.fielderId : fielderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
