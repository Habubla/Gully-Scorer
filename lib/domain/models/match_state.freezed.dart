// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchState {

 String get matchId; MatchConfiguration get config; int get totalRuns; int get totalWickets; int get legalDeliveries; List<PlayerState> get players; String? get currentStrikerId; String? get currentNonStrikerId; String? get currentBowlerId; InningsStatus get inningsStatus; MatchStatus get matchStatus; int? get targetScore; String? get matchResult; String get firstInningsBattingTeamId; String get currentBattingTeamId; int get inningsCount; int get team1Score; int get team2Score; int get runsInCurrentOver; bool get isFreeHit;
/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchStateCopyWith<MatchState> get copyWith => _$MatchStateCopyWithImpl<MatchState>(this as MatchState, _$identity);

  /// Serializes this MatchState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchState&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.config, config) || other.config == config)&&(identical(other.totalRuns, totalRuns) || other.totalRuns == totalRuns)&&(identical(other.totalWickets, totalWickets) || other.totalWickets == totalWickets)&&(identical(other.legalDeliveries, legalDeliveries) || other.legalDeliveries == legalDeliveries)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.currentStrikerId, currentStrikerId) || other.currentStrikerId == currentStrikerId)&&(identical(other.currentNonStrikerId, currentNonStrikerId) || other.currentNonStrikerId == currentNonStrikerId)&&(identical(other.currentBowlerId, currentBowlerId) || other.currentBowlerId == currentBowlerId)&&(identical(other.inningsStatus, inningsStatus) || other.inningsStatus == inningsStatus)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.targetScore, targetScore) || other.targetScore == targetScore)&&(identical(other.matchResult, matchResult) || other.matchResult == matchResult)&&(identical(other.firstInningsBattingTeamId, firstInningsBattingTeamId) || other.firstInningsBattingTeamId == firstInningsBattingTeamId)&&(identical(other.currentBattingTeamId, currentBattingTeamId) || other.currentBattingTeamId == currentBattingTeamId)&&(identical(other.inningsCount, inningsCount) || other.inningsCount == inningsCount)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.runsInCurrentOver, runsInCurrentOver) || other.runsInCurrentOver == runsInCurrentOver)&&(identical(other.isFreeHit, isFreeHit) || other.isFreeHit == isFreeHit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,matchId,config,totalRuns,totalWickets,legalDeliveries,const DeepCollectionEquality().hash(players),currentStrikerId,currentNonStrikerId,currentBowlerId,inningsStatus,matchStatus,targetScore,matchResult,firstInningsBattingTeamId,currentBattingTeamId,inningsCount,team1Score,team2Score,runsInCurrentOver,isFreeHit]);

@override
String toString() {
  return 'MatchState(matchId: $matchId, config: $config, totalRuns: $totalRuns, totalWickets: $totalWickets, legalDeliveries: $legalDeliveries, players: $players, currentStrikerId: $currentStrikerId, currentNonStrikerId: $currentNonStrikerId, currentBowlerId: $currentBowlerId, inningsStatus: $inningsStatus, matchStatus: $matchStatus, targetScore: $targetScore, matchResult: $matchResult, firstInningsBattingTeamId: $firstInningsBattingTeamId, currentBattingTeamId: $currentBattingTeamId, inningsCount: $inningsCount, team1Score: $team1Score, team2Score: $team2Score, runsInCurrentOver: $runsInCurrentOver, isFreeHit: $isFreeHit)';
}


}

/// @nodoc
abstract mixin class $MatchStateCopyWith<$Res>  {
  factory $MatchStateCopyWith(MatchState value, $Res Function(MatchState) _then) = _$MatchStateCopyWithImpl;
@useResult
$Res call({
 String matchId, MatchConfiguration config, int totalRuns, int totalWickets, int legalDeliveries, List<PlayerState> players, String? currentStrikerId, String? currentNonStrikerId, String? currentBowlerId, InningsStatus inningsStatus, MatchStatus matchStatus, int? targetScore, String? matchResult, String firstInningsBattingTeamId, String currentBattingTeamId, int inningsCount, int team1Score, int team2Score, int runsInCurrentOver, bool isFreeHit
});


$MatchConfigurationCopyWith<$Res> get config;

}
/// @nodoc
class _$MatchStateCopyWithImpl<$Res>
    implements $MatchStateCopyWith<$Res> {
  _$MatchStateCopyWithImpl(this._self, this._then);

  final MatchState _self;
  final $Res Function(MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = null,Object? config = null,Object? totalRuns = null,Object? totalWickets = null,Object? legalDeliveries = null,Object? players = null,Object? currentStrikerId = freezed,Object? currentNonStrikerId = freezed,Object? currentBowlerId = freezed,Object? inningsStatus = null,Object? matchStatus = null,Object? targetScore = freezed,Object? matchResult = freezed,Object? firstInningsBattingTeamId = null,Object? currentBattingTeamId = null,Object? inningsCount = null,Object? team1Score = null,Object? team2Score = null,Object? runsInCurrentOver = null,Object? isFreeHit = null,}) {
  return _then(_self.copyWith(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as MatchConfiguration,totalRuns: null == totalRuns ? _self.totalRuns : totalRuns // ignore: cast_nullable_to_non_nullable
as int,totalWickets: null == totalWickets ? _self.totalWickets : totalWickets // ignore: cast_nullable_to_non_nullable
as int,legalDeliveries: null == legalDeliveries ? _self.legalDeliveries : legalDeliveries // ignore: cast_nullable_to_non_nullable
as int,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerState>,currentStrikerId: freezed == currentStrikerId ? _self.currentStrikerId : currentStrikerId // ignore: cast_nullable_to_non_nullable
as String?,currentNonStrikerId: freezed == currentNonStrikerId ? _self.currentNonStrikerId : currentNonStrikerId // ignore: cast_nullable_to_non_nullable
as String?,currentBowlerId: freezed == currentBowlerId ? _self.currentBowlerId : currentBowlerId // ignore: cast_nullable_to_non_nullable
as String?,inningsStatus: null == inningsStatus ? _self.inningsStatus : inningsStatus // ignore: cast_nullable_to_non_nullable
as InningsStatus,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as MatchStatus,targetScore: freezed == targetScore ? _self.targetScore : targetScore // ignore: cast_nullable_to_non_nullable
as int?,matchResult: freezed == matchResult ? _self.matchResult : matchResult // ignore: cast_nullable_to_non_nullable
as String?,firstInningsBattingTeamId: null == firstInningsBattingTeamId ? _self.firstInningsBattingTeamId : firstInningsBattingTeamId // ignore: cast_nullable_to_non_nullable
as String,currentBattingTeamId: null == currentBattingTeamId ? _self.currentBattingTeamId : currentBattingTeamId // ignore: cast_nullable_to_non_nullable
as String,inningsCount: null == inningsCount ? _self.inningsCount : inningsCount // ignore: cast_nullable_to_non_nullable
as int,team1Score: null == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as int,team2Score: null == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as int,runsInCurrentOver: null == runsInCurrentOver ? _self.runsInCurrentOver : runsInCurrentOver // ignore: cast_nullable_to_non_nullable
as int,isFreeHit: null == isFreeHit ? _self.isFreeHit : isFreeHit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchConfigurationCopyWith<$Res> get config {
  
  return $MatchConfigurationCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchState].
extension MatchStatePatterns on MatchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchState value)  $default,){
final _that = this;
switch (_that) {
case _MatchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String matchId,  MatchConfiguration config,  int totalRuns,  int totalWickets,  int legalDeliveries,  List<PlayerState> players,  String? currentStrikerId,  String? currentNonStrikerId,  String? currentBowlerId,  InningsStatus inningsStatus,  MatchStatus matchStatus,  int? targetScore,  String? matchResult,  String firstInningsBattingTeamId,  String currentBattingTeamId,  int inningsCount,  int team1Score,  int team2Score,  int runsInCurrentOver,  bool isFreeHit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchState() when $default != null:
return $default(_that.matchId,_that.config,_that.totalRuns,_that.totalWickets,_that.legalDeliveries,_that.players,_that.currentStrikerId,_that.currentNonStrikerId,_that.currentBowlerId,_that.inningsStatus,_that.matchStatus,_that.targetScore,_that.matchResult,_that.firstInningsBattingTeamId,_that.currentBattingTeamId,_that.inningsCount,_that.team1Score,_that.team2Score,_that.runsInCurrentOver,_that.isFreeHit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String matchId,  MatchConfiguration config,  int totalRuns,  int totalWickets,  int legalDeliveries,  List<PlayerState> players,  String? currentStrikerId,  String? currentNonStrikerId,  String? currentBowlerId,  InningsStatus inningsStatus,  MatchStatus matchStatus,  int? targetScore,  String? matchResult,  String firstInningsBattingTeamId,  String currentBattingTeamId,  int inningsCount,  int team1Score,  int team2Score,  int runsInCurrentOver,  bool isFreeHit)  $default,) {final _that = this;
switch (_that) {
case _MatchState():
return $default(_that.matchId,_that.config,_that.totalRuns,_that.totalWickets,_that.legalDeliveries,_that.players,_that.currentStrikerId,_that.currentNonStrikerId,_that.currentBowlerId,_that.inningsStatus,_that.matchStatus,_that.targetScore,_that.matchResult,_that.firstInningsBattingTeamId,_that.currentBattingTeamId,_that.inningsCount,_that.team1Score,_that.team2Score,_that.runsInCurrentOver,_that.isFreeHit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String matchId,  MatchConfiguration config,  int totalRuns,  int totalWickets,  int legalDeliveries,  List<PlayerState> players,  String? currentStrikerId,  String? currentNonStrikerId,  String? currentBowlerId,  InningsStatus inningsStatus,  MatchStatus matchStatus,  int? targetScore,  String? matchResult,  String firstInningsBattingTeamId,  String currentBattingTeamId,  int inningsCount,  int team1Score,  int team2Score,  int runsInCurrentOver,  bool isFreeHit)?  $default,) {final _that = this;
switch (_that) {
case _MatchState() when $default != null:
return $default(_that.matchId,_that.config,_that.totalRuns,_that.totalWickets,_that.legalDeliveries,_that.players,_that.currentStrikerId,_that.currentNonStrikerId,_that.currentBowlerId,_that.inningsStatus,_that.matchStatus,_that.targetScore,_that.matchResult,_that.firstInningsBattingTeamId,_that.currentBattingTeamId,_that.inningsCount,_that.team1Score,_that.team2Score,_that.runsInCurrentOver,_that.isFreeHit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchState implements MatchState {
  const _MatchState({required this.matchId, required this.config, this.totalRuns = 0, this.totalWickets = 0, this.legalDeliveries = 0, final  List<PlayerState> players = const [], this.currentStrikerId, this.currentNonStrikerId, this.currentBowlerId, this.inningsStatus = InningsStatus.notStarted, this.matchStatus = MatchStatus.creating, this.targetScore, this.matchResult, this.firstInningsBattingTeamId = 'team_1', this.currentBattingTeamId = 'team_1', this.inningsCount = 1, this.team1Score = 0, this.team2Score = 0, this.runsInCurrentOver = 0, this.isFreeHit = false}): _players = players;
  factory _MatchState.fromJson(Map<String, dynamic> json) => _$MatchStateFromJson(json);

@override final  String matchId;
@override final  MatchConfiguration config;
@override@JsonKey() final  int totalRuns;
@override@JsonKey() final  int totalWickets;
@override@JsonKey() final  int legalDeliveries;
 final  List<PlayerState> _players;
@override@JsonKey() List<PlayerState> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

@override final  String? currentStrikerId;
@override final  String? currentNonStrikerId;
@override final  String? currentBowlerId;
@override@JsonKey() final  InningsStatus inningsStatus;
@override@JsonKey() final  MatchStatus matchStatus;
@override final  int? targetScore;
@override final  String? matchResult;
@override@JsonKey() final  String firstInningsBattingTeamId;
@override@JsonKey() final  String currentBattingTeamId;
@override@JsonKey() final  int inningsCount;
@override@JsonKey() final  int team1Score;
@override@JsonKey() final  int team2Score;
@override@JsonKey() final  int runsInCurrentOver;
@override@JsonKey() final  bool isFreeHit;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchStateCopyWith<_MatchState> get copyWith => __$MatchStateCopyWithImpl<_MatchState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchState&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.config, config) || other.config == config)&&(identical(other.totalRuns, totalRuns) || other.totalRuns == totalRuns)&&(identical(other.totalWickets, totalWickets) || other.totalWickets == totalWickets)&&(identical(other.legalDeliveries, legalDeliveries) || other.legalDeliveries == legalDeliveries)&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.currentStrikerId, currentStrikerId) || other.currentStrikerId == currentStrikerId)&&(identical(other.currentNonStrikerId, currentNonStrikerId) || other.currentNonStrikerId == currentNonStrikerId)&&(identical(other.currentBowlerId, currentBowlerId) || other.currentBowlerId == currentBowlerId)&&(identical(other.inningsStatus, inningsStatus) || other.inningsStatus == inningsStatus)&&(identical(other.matchStatus, matchStatus) || other.matchStatus == matchStatus)&&(identical(other.targetScore, targetScore) || other.targetScore == targetScore)&&(identical(other.matchResult, matchResult) || other.matchResult == matchResult)&&(identical(other.firstInningsBattingTeamId, firstInningsBattingTeamId) || other.firstInningsBattingTeamId == firstInningsBattingTeamId)&&(identical(other.currentBattingTeamId, currentBattingTeamId) || other.currentBattingTeamId == currentBattingTeamId)&&(identical(other.inningsCount, inningsCount) || other.inningsCount == inningsCount)&&(identical(other.team1Score, team1Score) || other.team1Score == team1Score)&&(identical(other.team2Score, team2Score) || other.team2Score == team2Score)&&(identical(other.runsInCurrentOver, runsInCurrentOver) || other.runsInCurrentOver == runsInCurrentOver)&&(identical(other.isFreeHit, isFreeHit) || other.isFreeHit == isFreeHit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,matchId,config,totalRuns,totalWickets,legalDeliveries,const DeepCollectionEquality().hash(_players),currentStrikerId,currentNonStrikerId,currentBowlerId,inningsStatus,matchStatus,targetScore,matchResult,firstInningsBattingTeamId,currentBattingTeamId,inningsCount,team1Score,team2Score,runsInCurrentOver,isFreeHit]);

@override
String toString() {
  return 'MatchState(matchId: $matchId, config: $config, totalRuns: $totalRuns, totalWickets: $totalWickets, legalDeliveries: $legalDeliveries, players: $players, currentStrikerId: $currentStrikerId, currentNonStrikerId: $currentNonStrikerId, currentBowlerId: $currentBowlerId, inningsStatus: $inningsStatus, matchStatus: $matchStatus, targetScore: $targetScore, matchResult: $matchResult, firstInningsBattingTeamId: $firstInningsBattingTeamId, currentBattingTeamId: $currentBattingTeamId, inningsCount: $inningsCount, team1Score: $team1Score, team2Score: $team2Score, runsInCurrentOver: $runsInCurrentOver, isFreeHit: $isFreeHit)';
}


}

/// @nodoc
abstract mixin class _$MatchStateCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$MatchStateCopyWith(_MatchState value, $Res Function(_MatchState) _then) = __$MatchStateCopyWithImpl;
@override @useResult
$Res call({
 String matchId, MatchConfiguration config, int totalRuns, int totalWickets, int legalDeliveries, List<PlayerState> players, String? currentStrikerId, String? currentNonStrikerId, String? currentBowlerId, InningsStatus inningsStatus, MatchStatus matchStatus, int? targetScore, String? matchResult, String firstInningsBattingTeamId, String currentBattingTeamId, int inningsCount, int team1Score, int team2Score, int runsInCurrentOver, bool isFreeHit
});


@override $MatchConfigurationCopyWith<$Res> get config;

}
/// @nodoc
class __$MatchStateCopyWithImpl<$Res>
    implements _$MatchStateCopyWith<$Res> {
  __$MatchStateCopyWithImpl(this._self, this._then);

  final _MatchState _self;
  final $Res Function(_MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? config = null,Object? totalRuns = null,Object? totalWickets = null,Object? legalDeliveries = null,Object? players = null,Object? currentStrikerId = freezed,Object? currentNonStrikerId = freezed,Object? currentBowlerId = freezed,Object? inningsStatus = null,Object? matchStatus = null,Object? targetScore = freezed,Object? matchResult = freezed,Object? firstInningsBattingTeamId = null,Object? currentBattingTeamId = null,Object? inningsCount = null,Object? team1Score = null,Object? team2Score = null,Object? runsInCurrentOver = null,Object? isFreeHit = null,}) {
  return _then(_MatchState(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as MatchConfiguration,totalRuns: null == totalRuns ? _self.totalRuns : totalRuns // ignore: cast_nullable_to_non_nullable
as int,totalWickets: null == totalWickets ? _self.totalWickets : totalWickets // ignore: cast_nullable_to_non_nullable
as int,legalDeliveries: null == legalDeliveries ? _self.legalDeliveries : legalDeliveries // ignore: cast_nullable_to_non_nullable
as int,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerState>,currentStrikerId: freezed == currentStrikerId ? _self.currentStrikerId : currentStrikerId // ignore: cast_nullable_to_non_nullable
as String?,currentNonStrikerId: freezed == currentNonStrikerId ? _self.currentNonStrikerId : currentNonStrikerId // ignore: cast_nullable_to_non_nullable
as String?,currentBowlerId: freezed == currentBowlerId ? _self.currentBowlerId : currentBowlerId // ignore: cast_nullable_to_non_nullable
as String?,inningsStatus: null == inningsStatus ? _self.inningsStatus : inningsStatus // ignore: cast_nullable_to_non_nullable
as InningsStatus,matchStatus: null == matchStatus ? _self.matchStatus : matchStatus // ignore: cast_nullable_to_non_nullable
as MatchStatus,targetScore: freezed == targetScore ? _self.targetScore : targetScore // ignore: cast_nullable_to_non_nullable
as int?,matchResult: freezed == matchResult ? _self.matchResult : matchResult // ignore: cast_nullable_to_non_nullable
as String?,firstInningsBattingTeamId: null == firstInningsBattingTeamId ? _self.firstInningsBattingTeamId : firstInningsBattingTeamId // ignore: cast_nullable_to_non_nullable
as String,currentBattingTeamId: null == currentBattingTeamId ? _self.currentBattingTeamId : currentBattingTeamId // ignore: cast_nullable_to_non_nullable
as String,inningsCount: null == inningsCount ? _self.inningsCount : inningsCount // ignore: cast_nullable_to_non_nullable
as int,team1Score: null == team1Score ? _self.team1Score : team1Score // ignore: cast_nullable_to_non_nullable
as int,team2Score: null == team2Score ? _self.team2Score : team2Score // ignore: cast_nullable_to_non_nullable
as int,runsInCurrentOver: null == runsInCurrentOver ? _self.runsInCurrentOver : runsInCurrentOver // ignore: cast_nullable_to_non_nullable
as int,isFreeHit: null == isFreeHit ? _self.isFreeHit : isFreeHit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchConfigurationCopyWith<$Res> get config {
  
  return $MatchConfigurationCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
