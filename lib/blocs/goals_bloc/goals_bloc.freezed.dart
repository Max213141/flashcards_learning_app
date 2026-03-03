// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalsEvent()';
}


}

/// @nodoc
class $GoalsEventCopyWith<$Res>  {
$GoalsEventCopyWith(GoalsEvent _, $Res Function(GoalsEvent) __);
}


/// Adds pattern-matching-related methods to [GoalsEvent].
extension GoalsEventPatterns on GoalsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GoalsUpdated value)?  goalsUpdated,TResult Function( _ProgressUpdated value)?  progressUpdated,TResult Function( _SaveRequested value)?  saveRequested,TResult Function( _MidnightRefreshTriggered value)?  midnightRefreshTriggered,TResult Function( _FailureOccurred value)?  failureOccurred,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GoalsUpdated() when goalsUpdated != null:
return goalsUpdated(_that);case _ProgressUpdated() when progressUpdated != null:
return progressUpdated(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _MidnightRefreshTriggered() when midnightRefreshTriggered != null:
return midnightRefreshTriggered(_that);case _FailureOccurred() when failureOccurred != null:
return failureOccurred(_that);case _StatusConsumed() when statusConsumed != null:
return statusConsumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GoalsUpdated value)  goalsUpdated,required TResult Function( _ProgressUpdated value)  progressUpdated,required TResult Function( _SaveRequested value)  saveRequested,required TResult Function( _MidnightRefreshTriggered value)  midnightRefreshTriggered,required TResult Function( _FailureOccurred value)  failureOccurred,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GoalsUpdated():
return goalsUpdated(_that);case _ProgressUpdated():
return progressUpdated(_that);case _SaveRequested():
return saveRequested(_that);case _MidnightRefreshTriggered():
return midnightRefreshTriggered(_that);case _FailureOccurred():
return failureOccurred(_that);case _StatusConsumed():
return statusConsumed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GoalsUpdated value)?  goalsUpdated,TResult? Function( _ProgressUpdated value)?  progressUpdated,TResult? Function( _SaveRequested value)?  saveRequested,TResult? Function( _MidnightRefreshTriggered value)?  midnightRefreshTriggered,TResult? Function( _FailureOccurred value)?  failureOccurred,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GoalsUpdated() when goalsUpdated != null:
return goalsUpdated(_that);case _ProgressUpdated() when progressUpdated != null:
return progressUpdated(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _MidnightRefreshTriggered() when midnightRefreshTriggered != null:
return midnightRefreshTriggered(_that);case _FailureOccurred() when failureOccurred != null:
return failureOccurred(_that);case _StatusConsumed() when statusConsumed != null:
return statusConsumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UserGoals? goals)?  goalsUpdated,TResult Function( WordsProgressStats progressStats)?  progressUpdated,TResult Function( String totalGoal,  String dailyGoal)?  saveRequested,TResult Function()?  midnightRefreshTriggered,TResult Function( String message)?  failureOccurred,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GoalsUpdated() when goalsUpdated != null:
return goalsUpdated(_that.goals);case _ProgressUpdated() when progressUpdated != null:
return progressUpdated(_that.progressStats);case _SaveRequested() when saveRequested != null:
return saveRequested(_that.totalGoal,_that.dailyGoal);case _MidnightRefreshTriggered() when midnightRefreshTriggered != null:
return midnightRefreshTriggered();case _FailureOccurred() when failureOccurred != null:
return failureOccurred(_that.message);case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UserGoals? goals)  goalsUpdated,required TResult Function( WordsProgressStats progressStats)  progressUpdated,required TResult Function( String totalGoal,  String dailyGoal)  saveRequested,required TResult Function()  midnightRefreshTriggered,required TResult Function( String message)  failureOccurred,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GoalsUpdated():
return goalsUpdated(_that.goals);case _ProgressUpdated():
return progressUpdated(_that.progressStats);case _SaveRequested():
return saveRequested(_that.totalGoal,_that.dailyGoal);case _MidnightRefreshTriggered():
return midnightRefreshTriggered();case _FailureOccurred():
return failureOccurred(_that.message);case _StatusConsumed():
return statusConsumed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UserGoals? goals)?  goalsUpdated,TResult? Function( WordsProgressStats progressStats)?  progressUpdated,TResult? Function( String totalGoal,  String dailyGoal)?  saveRequested,TResult? Function()?  midnightRefreshTriggered,TResult? Function( String message)?  failureOccurred,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GoalsUpdated() when goalsUpdated != null:
return goalsUpdated(_that.goals);case _ProgressUpdated() when progressUpdated != null:
return progressUpdated(_that.progressStats);case _SaveRequested() when saveRequested != null:
return saveRequested(_that.totalGoal,_that.dailyGoal);case _MidnightRefreshTriggered() when midnightRefreshTriggered != null:
return midnightRefreshTriggered();case _FailureOccurred() when failureOccurred != null:
return failureOccurred(_that.message);case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GoalsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalsEvent.started()';
}


}




/// @nodoc


class _GoalsUpdated implements GoalsEvent {
  const _GoalsUpdated({required this.goals});
  

 final  UserGoals? goals;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsUpdatedCopyWith<_GoalsUpdated> get copyWith => __$GoalsUpdatedCopyWithImpl<_GoalsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsUpdated&&(identical(other.goals, goals) || other.goals == goals));
}


@override
int get hashCode => Object.hash(runtimeType,goals);

@override
String toString() {
  return 'GoalsEvent.goalsUpdated(goals: $goals)';
}


}

/// @nodoc
abstract mixin class _$GoalsUpdatedCopyWith<$Res> implements $GoalsEventCopyWith<$Res> {
  factory _$GoalsUpdatedCopyWith(_GoalsUpdated value, $Res Function(_GoalsUpdated) _then) = __$GoalsUpdatedCopyWithImpl;
@useResult
$Res call({
 UserGoals? goals
});




}
/// @nodoc
class __$GoalsUpdatedCopyWithImpl<$Res>
    implements _$GoalsUpdatedCopyWith<$Res> {
  __$GoalsUpdatedCopyWithImpl(this._self, this._then);

  final _GoalsUpdated _self;
  final $Res Function(_GoalsUpdated) _then;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goals = freezed,}) {
  return _then(_GoalsUpdated(
goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as UserGoals?,
  ));
}


}

/// @nodoc


class _ProgressUpdated implements GoalsEvent {
  const _ProgressUpdated({required this.progressStats});
  

 final  WordsProgressStats progressStats;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressUpdatedCopyWith<_ProgressUpdated> get copyWith => __$ProgressUpdatedCopyWithImpl<_ProgressUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressUpdated&&(identical(other.progressStats, progressStats) || other.progressStats == progressStats));
}


@override
int get hashCode => Object.hash(runtimeType,progressStats);

@override
String toString() {
  return 'GoalsEvent.progressUpdated(progressStats: $progressStats)';
}


}

/// @nodoc
abstract mixin class _$ProgressUpdatedCopyWith<$Res> implements $GoalsEventCopyWith<$Res> {
  factory _$ProgressUpdatedCopyWith(_ProgressUpdated value, $Res Function(_ProgressUpdated) _then) = __$ProgressUpdatedCopyWithImpl;
@useResult
$Res call({
 WordsProgressStats progressStats
});




}
/// @nodoc
class __$ProgressUpdatedCopyWithImpl<$Res>
    implements _$ProgressUpdatedCopyWith<$Res> {
  __$ProgressUpdatedCopyWithImpl(this._self, this._then);

  final _ProgressUpdated _self;
  final $Res Function(_ProgressUpdated) _then;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progressStats = null,}) {
  return _then(_ProgressUpdated(
progressStats: null == progressStats ? _self.progressStats : progressStats // ignore: cast_nullable_to_non_nullable
as WordsProgressStats,
  ));
}


}

/// @nodoc


class _SaveRequested implements GoalsEvent {
  const _SaveRequested({required this.totalGoal, required this.dailyGoal});
  

 final  String totalGoal;
 final  String dailyGoal;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRequestedCopyWith<_SaveRequested> get copyWith => __$SaveRequestedCopyWithImpl<_SaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRequested&&(identical(other.totalGoal, totalGoal) || other.totalGoal == totalGoal)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal));
}


@override
int get hashCode => Object.hash(runtimeType,totalGoal,dailyGoal);

@override
String toString() {
  return 'GoalsEvent.saveRequested(totalGoal: $totalGoal, dailyGoal: $dailyGoal)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $GoalsEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@useResult
$Res call({
 String totalGoal, String dailyGoal
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totalGoal = null,Object? dailyGoal = null,}) {
  return _then(_SaveRequested(
totalGoal: null == totalGoal ? _self.totalGoal : totalGoal // ignore: cast_nullable_to_non_nullable
as String,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MidnightRefreshTriggered implements GoalsEvent {
  const _MidnightRefreshTriggered();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MidnightRefreshTriggered);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalsEvent.midnightRefreshTriggered()';
}


}




/// @nodoc


class _FailureOccurred implements GoalsEvent {
  const _FailureOccurred({required this.message});
  

 final  String message;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureOccurredCopyWith<_FailureOccurred> get copyWith => __$FailureOccurredCopyWithImpl<_FailureOccurred>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureOccurred&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GoalsEvent.failureOccurred(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureOccurredCopyWith<$Res> implements $GoalsEventCopyWith<$Res> {
  factory _$FailureOccurredCopyWith(_FailureOccurred value, $Res Function(_FailureOccurred) _then) = __$FailureOccurredCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureOccurredCopyWithImpl<$Res>
    implements _$FailureOccurredCopyWith<$Res> {
  __$FailureOccurredCopyWithImpl(this._self, this._then);

  final _FailureOccurred _self;
  final $Res Function(_FailureOccurred) _then;

/// Create a copy of GoalsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_FailureOccurred(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StatusConsumed implements GoalsEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GoalsEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$GoalsState {

 UserGoals? get currentGoals; WordsProgressStats? get progressStats; String get totalGoalInput; String get dailyGoalInput; bool get isLoading; bool get isSaving; GoalsStatus get status; String? get message;
/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsStateCopyWith<GoalsState> get copyWith => _$GoalsStateCopyWithImpl<GoalsState>(this as GoalsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsState&&(identical(other.currentGoals, currentGoals) || other.currentGoals == currentGoals)&&(identical(other.progressStats, progressStats) || other.progressStats == progressStats)&&(identical(other.totalGoalInput, totalGoalInput) || other.totalGoalInput == totalGoalInput)&&(identical(other.dailyGoalInput, dailyGoalInput) || other.dailyGoalInput == dailyGoalInput)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,currentGoals,progressStats,totalGoalInput,dailyGoalInput,isLoading,isSaving,status,message);

@override
String toString() {
  return 'GoalsState(currentGoals: $currentGoals, progressStats: $progressStats, totalGoalInput: $totalGoalInput, dailyGoalInput: $dailyGoalInput, isLoading: $isLoading, isSaving: $isSaving, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $GoalsStateCopyWith<$Res>  {
  factory $GoalsStateCopyWith(GoalsState value, $Res Function(GoalsState) _then) = _$GoalsStateCopyWithImpl;
@useResult
$Res call({
 UserGoals? currentGoals, WordsProgressStats? progressStats, String totalGoalInput, String dailyGoalInput, bool isLoading, bool isSaving, GoalsStatus status, String? message
});




}
/// @nodoc
class _$GoalsStateCopyWithImpl<$Res>
    implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._self, this._then);

  final GoalsState _self;
  final $Res Function(GoalsState) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentGoals = freezed,Object? progressStats = freezed,Object? totalGoalInput = null,Object? dailyGoalInput = null,Object? isLoading = null,Object? isSaving = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
currentGoals: freezed == currentGoals ? _self.currentGoals : currentGoals // ignore: cast_nullable_to_non_nullable
as UserGoals?,progressStats: freezed == progressStats ? _self.progressStats : progressStats // ignore: cast_nullable_to_non_nullable
as WordsProgressStats?,totalGoalInput: null == totalGoalInput ? _self.totalGoalInput : totalGoalInput // ignore: cast_nullable_to_non_nullable
as String,dailyGoalInput: null == dailyGoalInput ? _self.dailyGoalInput : dailyGoalInput // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalsStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsState].
extension GoalsStatePatterns on GoalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserGoals? currentGoals,  WordsProgressStats? progressStats,  String totalGoalInput,  String dailyGoalInput,  bool isLoading,  bool isSaving,  GoalsStatus status,  String? message)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.currentGoals,_that.progressStats,_that.totalGoalInput,_that.dailyGoalInput,_that.isLoading,_that.isSaving,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserGoals? currentGoals,  WordsProgressStats? progressStats,  String totalGoalInput,  String dailyGoalInput,  bool isLoading,  bool isSaving,  GoalsStatus status,  String? message)  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.currentGoals,_that.progressStats,_that.totalGoalInput,_that.dailyGoalInput,_that.isLoading,_that.isSaving,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserGoals? currentGoals,  WordsProgressStats? progressStats,  String totalGoalInput,  String dailyGoalInput,  bool isLoading,  bool isSaving,  GoalsStatus status,  String? message)?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.currentGoals,_that.progressStats,_that.totalGoalInput,_that.dailyGoalInput,_that.isLoading,_that.isSaving,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GoalsState {
  const _Initial({this.currentGoals, this.progressStats, this.totalGoalInput = '', this.dailyGoalInput = '', this.isLoading = false, this.isSaving = false, this.status = GoalsStatus.initial, this.message});
  

@override final  UserGoals? currentGoals;
@override final  WordsProgressStats? progressStats;
@override@JsonKey() final  String totalGoalInput;
@override@JsonKey() final  String dailyGoalInput;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  GoalsStatus status;
@override final  String? message;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.currentGoals, currentGoals) || other.currentGoals == currentGoals)&&(identical(other.progressStats, progressStats) || other.progressStats == progressStats)&&(identical(other.totalGoalInput, totalGoalInput) || other.totalGoalInput == totalGoalInput)&&(identical(other.dailyGoalInput, dailyGoalInput) || other.dailyGoalInput == dailyGoalInput)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,currentGoals,progressStats,totalGoalInput,dailyGoalInput,isLoading,isSaving,status,message);

@override
String toString() {
  return 'GoalsState.initial(currentGoals: $currentGoals, progressStats: $progressStats, totalGoalInput: $totalGoalInput, dailyGoalInput: $dailyGoalInput, isLoading: $isLoading, isSaving: $isSaving, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $GoalsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 UserGoals? currentGoals, WordsProgressStats? progressStats, String totalGoalInput, String dailyGoalInput, bool isLoading, bool isSaving, GoalsStatus status, String? message
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentGoals = freezed,Object? progressStats = freezed,Object? totalGoalInput = null,Object? dailyGoalInput = null,Object? isLoading = null,Object? isSaving = null,Object? status = null,Object? message = freezed,}) {
  return _then(_Initial(
currentGoals: freezed == currentGoals ? _self.currentGoals : currentGoals // ignore: cast_nullable_to_non_nullable
as UserGoals?,progressStats: freezed == progressStats ? _self.progressStats : progressStats // ignore: cast_nullable_to_non_nullable
as WordsProgressStats?,totalGoalInput: null == totalGoalInput ? _self.totalGoalInput : totalGoalInput // ignore: cast_nullable_to_non_nullable
as String,dailyGoalInput: null == dailyGoalInput ? _self.dailyGoalInput : dailyGoalInput // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalsStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
