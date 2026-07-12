// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchConfiguration {

 MatchFormat get format; double? get maxOvers; int get playersPerTeam; String get team1Name; String get team2Name; bool get lastManStanding;
/// Create a copy of MatchConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchConfigurationCopyWith<MatchConfiguration> get copyWith => _$MatchConfigurationCopyWithImpl<MatchConfiguration>(this as MatchConfiguration, _$identity);

  /// Serializes this MatchConfiguration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchConfiguration&&(identical(other.format, format) || other.format == format)&&(identical(other.maxOvers, maxOvers) || other.maxOvers == maxOvers)&&(identical(other.playersPerTeam, playersPerTeam) || other.playersPerTeam == playersPerTeam)&&(identical(other.team1Name, team1Name) || other.team1Name == team1Name)&&(identical(other.team2Name, team2Name) || other.team2Name == team2Name)&&(identical(other.lastManStanding, lastManStanding) || other.lastManStanding == lastManStanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,format,maxOvers,playersPerTeam,team1Name,team2Name,lastManStanding);

@override
String toString() {
  return 'MatchConfiguration(format: $format, maxOvers: $maxOvers, playersPerTeam: $playersPerTeam, team1Name: $team1Name, team2Name: $team2Name, lastManStanding: $lastManStanding)';
}


}

/// @nodoc
abstract mixin class $MatchConfigurationCopyWith<$Res>  {
  factory $MatchConfigurationCopyWith(MatchConfiguration value, $Res Function(MatchConfiguration) _then) = _$MatchConfigurationCopyWithImpl;
@useResult
$Res call({
 MatchFormat format, double? maxOvers, int playersPerTeam, String team1Name, String team2Name, bool lastManStanding
});




}
/// @nodoc
class _$MatchConfigurationCopyWithImpl<$Res>
    implements $MatchConfigurationCopyWith<$Res> {
  _$MatchConfigurationCopyWithImpl(this._self, this._then);

  final MatchConfiguration _self;
  final $Res Function(MatchConfiguration) _then;

/// Create a copy of MatchConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? format = null,Object? maxOvers = freezed,Object? playersPerTeam = null,Object? team1Name = null,Object? team2Name = null,Object? lastManStanding = null,}) {
  return _then(_self.copyWith(
format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as MatchFormat,maxOvers: freezed == maxOvers ? _self.maxOvers : maxOvers // ignore: cast_nullable_to_non_nullable
as double?,playersPerTeam: null == playersPerTeam ? _self.playersPerTeam : playersPerTeam // ignore: cast_nullable_to_non_nullable
as int,team1Name: null == team1Name ? _self.team1Name : team1Name // ignore: cast_nullable_to_non_nullable
as String,team2Name: null == team2Name ? _self.team2Name : team2Name // ignore: cast_nullable_to_non_nullable
as String,lastManStanding: null == lastManStanding ? _self.lastManStanding : lastManStanding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchConfiguration].
extension MatchConfigurationPatterns on MatchConfiguration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchConfiguration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchConfiguration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchConfiguration value)  $default,){
final _that = this;
switch (_that) {
case _MatchConfiguration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchConfiguration value)?  $default,){
final _that = this;
switch (_that) {
case _MatchConfiguration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchFormat format,  double? maxOvers,  int playersPerTeam,  String team1Name,  String team2Name,  bool lastManStanding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchConfiguration() when $default != null:
return $default(_that.format,_that.maxOvers,_that.playersPerTeam,_that.team1Name,_that.team2Name,_that.lastManStanding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchFormat format,  double? maxOvers,  int playersPerTeam,  String team1Name,  String team2Name,  bool lastManStanding)  $default,) {final _that = this;
switch (_that) {
case _MatchConfiguration():
return $default(_that.format,_that.maxOvers,_that.playersPerTeam,_that.team1Name,_that.team2Name,_that.lastManStanding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchFormat format,  double? maxOvers,  int playersPerTeam,  String team1Name,  String team2Name,  bool lastManStanding)?  $default,) {final _that = this;
switch (_that) {
case _MatchConfiguration() when $default != null:
return $default(_that.format,_that.maxOvers,_that.playersPerTeam,_that.team1Name,_that.team2Name,_that.lastManStanding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchConfiguration implements MatchConfiguration {
  const _MatchConfiguration({required this.format, required this.maxOvers, required this.playersPerTeam, this.team1Name = 'Team 1', this.team2Name = 'Team 2', this.lastManStanding = true});
  factory _MatchConfiguration.fromJson(Map<String, dynamic> json) => _$MatchConfigurationFromJson(json);

@override final  MatchFormat format;
@override final  double? maxOvers;
@override final  int playersPerTeam;
@override@JsonKey() final  String team1Name;
@override@JsonKey() final  String team2Name;
@override@JsonKey() final  bool lastManStanding;

/// Create a copy of MatchConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchConfigurationCopyWith<_MatchConfiguration> get copyWith => __$MatchConfigurationCopyWithImpl<_MatchConfiguration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchConfigurationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchConfiguration&&(identical(other.format, format) || other.format == format)&&(identical(other.maxOvers, maxOvers) || other.maxOvers == maxOvers)&&(identical(other.playersPerTeam, playersPerTeam) || other.playersPerTeam == playersPerTeam)&&(identical(other.team1Name, team1Name) || other.team1Name == team1Name)&&(identical(other.team2Name, team2Name) || other.team2Name == team2Name)&&(identical(other.lastManStanding, lastManStanding) || other.lastManStanding == lastManStanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,format,maxOvers,playersPerTeam,team1Name,team2Name,lastManStanding);

@override
String toString() {
  return 'MatchConfiguration(format: $format, maxOvers: $maxOvers, playersPerTeam: $playersPerTeam, team1Name: $team1Name, team2Name: $team2Name, lastManStanding: $lastManStanding)';
}


}

/// @nodoc
abstract mixin class _$MatchConfigurationCopyWith<$Res> implements $MatchConfigurationCopyWith<$Res> {
  factory _$MatchConfigurationCopyWith(_MatchConfiguration value, $Res Function(_MatchConfiguration) _then) = __$MatchConfigurationCopyWithImpl;
@override @useResult
$Res call({
 MatchFormat format, double? maxOvers, int playersPerTeam, String team1Name, String team2Name, bool lastManStanding
});




}
/// @nodoc
class __$MatchConfigurationCopyWithImpl<$Res>
    implements _$MatchConfigurationCopyWith<$Res> {
  __$MatchConfigurationCopyWithImpl(this._self, this._then);

  final _MatchConfiguration _self;
  final $Res Function(_MatchConfiguration) _then;

/// Create a copy of MatchConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? format = null,Object? maxOvers = freezed,Object? playersPerTeam = null,Object? team1Name = null,Object? team2Name = null,Object? lastManStanding = null,}) {
  return _then(_MatchConfiguration(
format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as MatchFormat,maxOvers: freezed == maxOvers ? _self.maxOvers : maxOvers // ignore: cast_nullable_to_non_nullable
as double?,playersPerTeam: null == playersPerTeam ? _self.playersPerTeam : playersPerTeam // ignore: cast_nullable_to_non_nullable
as int,team1Name: null == team1Name ? _self.team1Name : team1Name // ignore: cast_nullable_to_non_nullable
as String,team2Name: null == team2Name ? _self.team2Name : team2Name // ignore: cast_nullable_to_non_nullable
as String,lastManStanding: null == lastManStanding ? _self.lastManStanding : lastManStanding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
