// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerState {

 String get id; String get name; String get teamId; int get runsScored; int get ballsFaced; int get fours; int get sixes; int get wicketsTaken; int get ballsBowled; int get runsConceded; int get maidens; PlayerMatchStatus get status; bool get hasBatted; String get dismissalDetails;
/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStateCopyWith<PlayerState> get copyWith => _$PlayerStateCopyWithImpl<PlayerState>(this as PlayerState, _$identity);

  /// Serializes this PlayerState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.maidens, maidens) || other.maidens == maidens)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasBatted, hasBatted) || other.hasBatted == hasBatted)&&(identical(other.dismissalDetails, dismissalDetails) || other.dismissalDetails == dismissalDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,teamId,runsScored,ballsFaced,fours,sixes,wicketsTaken,ballsBowled,runsConceded,maidens,status,hasBatted,dismissalDetails);

@override
String toString() {
  return 'PlayerState(id: $id, name: $name, teamId: $teamId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, wicketsTaken: $wicketsTaken, ballsBowled: $ballsBowled, runsConceded: $runsConceded, maidens: $maidens, status: $status, hasBatted: $hasBatted, dismissalDetails: $dismissalDetails)';
}


}

/// @nodoc
abstract mixin class $PlayerStateCopyWith<$Res>  {
  factory $PlayerStateCopyWith(PlayerState value, $Res Function(PlayerState) _then) = _$PlayerStateCopyWithImpl;
@useResult
$Res call({
 String id, String name, String teamId, int runsScored, int ballsFaced, int fours, int sixes, int wicketsTaken, int ballsBowled, int runsConceded, int maidens, PlayerMatchStatus status, bool hasBatted, String dismissalDetails
});




}
/// @nodoc
class _$PlayerStateCopyWithImpl<$Res>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._self, this._then);

  final PlayerState _self;
  final $Res Function(PlayerState) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? teamId = null,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? wicketsTaken = null,Object? ballsBowled = null,Object? runsConceded = null,Object? maidens = null,Object? status = null,Object? hasBatted = null,Object? dismissalDetails = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,wicketsTaken: null == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: null == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int,runsConceded: null == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int,maidens: null == maidens ? _self.maidens : maidens // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlayerMatchStatus,hasBatted: null == hasBatted ? _self.hasBatted : hasBatted // ignore: cast_nullable_to_non_nullable
as bool,dismissalDetails: null == dismissalDetails ? _self.dismissalDetails : dismissalDetails // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerState].
extension PlayerStatePatterns on PlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerState value)  $default,){
final _that = this;
switch (_that) {
case _PlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String teamId,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int wicketsTaken,  int ballsBowled,  int runsConceded,  int maidens,  PlayerMatchStatus status,  bool hasBatted,  String dismissalDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
return $default(_that.id,_that.name,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.wicketsTaken,_that.ballsBowled,_that.runsConceded,_that.maidens,_that.status,_that.hasBatted,_that.dismissalDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String teamId,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int wicketsTaken,  int ballsBowled,  int runsConceded,  int maidens,  PlayerMatchStatus status,  bool hasBatted,  String dismissalDetails)  $default,) {final _that = this;
switch (_that) {
case _PlayerState():
return $default(_that.id,_that.name,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.wicketsTaken,_that.ballsBowled,_that.runsConceded,_that.maidens,_that.status,_that.hasBatted,_that.dismissalDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String teamId,  int runsScored,  int ballsFaced,  int fours,  int sixes,  int wicketsTaken,  int ballsBowled,  int runsConceded,  int maidens,  PlayerMatchStatus status,  bool hasBatted,  String dismissalDetails)?  $default,) {final _that = this;
switch (_that) {
case _PlayerState() when $default != null:
return $default(_that.id,_that.name,_that.teamId,_that.runsScored,_that.ballsFaced,_that.fours,_that.sixes,_that.wicketsTaken,_that.ballsBowled,_that.runsConceded,_that.maidens,_that.status,_that.hasBatted,_that.dismissalDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerState implements PlayerState {
  const _PlayerState({required this.id, required this.name, required this.teamId, this.runsScored = 0, this.ballsFaced = 0, this.fours = 0, this.sixes = 0, this.wicketsTaken = 0, this.ballsBowled = 0, this.runsConceded = 0, this.maidens = 0, this.status = PlayerMatchStatus.waiting, this.hasBatted = false, this.dismissalDetails = ''});
  factory _PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);

@override final  String id;
@override final  String name;
@override final  String teamId;
@override@JsonKey() final  int runsScored;
@override@JsonKey() final  int ballsFaced;
@override@JsonKey() final  int fours;
@override@JsonKey() final  int sixes;
@override@JsonKey() final  int wicketsTaken;
@override@JsonKey() final  int ballsBowled;
@override@JsonKey() final  int runsConceded;
@override@JsonKey() final  int maidens;
@override@JsonKey() final  PlayerMatchStatus status;
@override@JsonKey() final  bool hasBatted;
@override@JsonKey() final  String dismissalDetails;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStateCopyWith<_PlayerState> get copyWith => __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.runsScored, runsScored) || other.runsScored == runsScored)&&(identical(other.ballsFaced, ballsFaced) || other.ballsFaced == ballsFaced)&&(identical(other.fours, fours) || other.fours == fours)&&(identical(other.sixes, sixes) || other.sixes == sixes)&&(identical(other.wicketsTaken, wicketsTaken) || other.wicketsTaken == wicketsTaken)&&(identical(other.ballsBowled, ballsBowled) || other.ballsBowled == ballsBowled)&&(identical(other.runsConceded, runsConceded) || other.runsConceded == runsConceded)&&(identical(other.maidens, maidens) || other.maidens == maidens)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasBatted, hasBatted) || other.hasBatted == hasBatted)&&(identical(other.dismissalDetails, dismissalDetails) || other.dismissalDetails == dismissalDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,teamId,runsScored,ballsFaced,fours,sixes,wicketsTaken,ballsBowled,runsConceded,maidens,status,hasBatted,dismissalDetails);

@override
String toString() {
  return 'PlayerState(id: $id, name: $name, teamId: $teamId, runsScored: $runsScored, ballsFaced: $ballsFaced, fours: $fours, sixes: $sixes, wicketsTaken: $wicketsTaken, ballsBowled: $ballsBowled, runsConceded: $runsConceded, maidens: $maidens, status: $status, hasBatted: $hasBatted, dismissalDetails: $dismissalDetails)';
}


}

/// @nodoc
abstract mixin class _$PlayerStateCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(_PlayerState value, $Res Function(_PlayerState) _then) = __$PlayerStateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String teamId, int runsScored, int ballsFaced, int fours, int sixes, int wicketsTaken, int ballsBowled, int runsConceded, int maidens, PlayerMatchStatus status, bool hasBatted, String dismissalDetails
});




}
/// @nodoc
class __$PlayerStateCopyWithImpl<$Res>
    implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(this._self, this._then);

  final _PlayerState _self;
  final $Res Function(_PlayerState) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? teamId = null,Object? runsScored = null,Object? ballsFaced = null,Object? fours = null,Object? sixes = null,Object? wicketsTaken = null,Object? ballsBowled = null,Object? runsConceded = null,Object? maidens = null,Object? status = null,Object? hasBatted = null,Object? dismissalDetails = null,}) {
  return _then(_PlayerState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,runsScored: null == runsScored ? _self.runsScored : runsScored // ignore: cast_nullable_to_non_nullable
as int,ballsFaced: null == ballsFaced ? _self.ballsFaced : ballsFaced // ignore: cast_nullable_to_non_nullable
as int,fours: null == fours ? _self.fours : fours // ignore: cast_nullable_to_non_nullable
as int,sixes: null == sixes ? _self.sixes : sixes // ignore: cast_nullable_to_non_nullable
as int,wicketsTaken: null == wicketsTaken ? _self.wicketsTaken : wicketsTaken // ignore: cast_nullable_to_non_nullable
as int,ballsBowled: null == ballsBowled ? _self.ballsBowled : ballsBowled // ignore: cast_nullable_to_non_nullable
as int,runsConceded: null == runsConceded ? _self.runsConceded : runsConceded // ignore: cast_nullable_to_non_nullable
as int,maidens: null == maidens ? _self.maidens : maidens // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlayerMatchStatus,hasBatted: null == hasBatted ? _self.hasBatted : hasBatted // ignore: cast_nullable_to_non_nullable
as bool,dismissalDetails: null == dismissalDetails ? _self.dismissalDetails : dismissalDetails // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
