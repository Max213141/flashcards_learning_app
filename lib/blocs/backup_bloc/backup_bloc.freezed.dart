// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackupEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupEvent()';
}


}

/// @nodoc
class $BackupEventCopyWith<$Res>  {
$BackupEventCopyWith(BackupEvent _, $Res Function(BackupEvent) __);
}


/// Adds pattern-matching-related methods to [BackupEvent].
extension BackupEventPatterns on BackupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ExportRequested value)?  exportRequested,TResult Function( _RestoreRequested value)?  restoreRequested,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExportRequested() when exportRequested != null:
return exportRequested(_that);case _RestoreRequested() when restoreRequested != null:
return restoreRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ExportRequested value)  exportRequested,required TResult Function( _RestoreRequested value)  restoreRequested,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _ExportRequested():
return exportRequested(_that);case _RestoreRequested():
return restoreRequested(_that);case _StatusConsumed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ExportRequested value)?  exportRequested,TResult? Function( _RestoreRequested value)?  restoreRequested,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _ExportRequested() when exportRequested != null:
return exportRequested(_that);case _RestoreRequested() when restoreRequested != null:
return restoreRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  exportRequested,TResult Function()?  restoreRequested,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExportRequested() when exportRequested != null:
return exportRequested();case _RestoreRequested() when restoreRequested != null:
return restoreRequested();case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  exportRequested,required TResult Function()  restoreRequested,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _ExportRequested():
return exportRequested();case _RestoreRequested():
return restoreRequested();case _StatusConsumed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  exportRequested,TResult? Function()?  restoreRequested,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _ExportRequested() when exportRequested != null:
return exportRequested();case _RestoreRequested() when restoreRequested != null:
return restoreRequested();case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _ExportRequested implements BackupEvent {
  const _ExportRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupEvent.exportRequested()';
}


}




/// @nodoc


class _RestoreRequested implements BackupEvent {
  const _RestoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupEvent.restoreRequested()';
}


}




/// @nodoc


class _StatusConsumed implements BackupEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$BackupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState()';
}


}

/// @nodoc
class $BackupStateCopyWith<$Res>  {
$BackupStateCopyWith(BackupState _, $Res Function(BackupState) __);
}


/// Adds pattern-matching-related methods to [BackupState].
extension BackupStatePatterns on BackupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Processing value)?  processing,TResult Function( _ExportSuccess value)?  exportSuccess,TResult Function( _RestoreSuccess value)?  restoreSuccess,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Processing() when processing != null:
return processing(_that);case _ExportSuccess() when exportSuccess != null:
return exportSuccess(_that);case _RestoreSuccess() when restoreSuccess != null:
return restoreSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Processing value)  processing,required TResult Function( _ExportSuccess value)  exportSuccess,required TResult Function( _RestoreSuccess value)  restoreSuccess,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Processing():
return processing(_that);case _ExportSuccess():
return exportSuccess(_that);case _RestoreSuccess():
return restoreSuccess(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Processing value)?  processing,TResult? Function( _ExportSuccess value)?  exportSuccess,TResult? Function( _RestoreSuccess value)?  restoreSuccess,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Processing() when processing != null:
return processing(_that);case _ExportSuccess() when exportSuccess != null:
return exportSuccess(_that);case _RestoreSuccess() when restoreSuccess != null:
return restoreSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( BackupOperation operation)?  processing,TResult Function( String message)?  exportSuccess,TResult Function( int restoredWordsCount,  String message)?  restoreSuccess,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Processing() when processing != null:
return processing(_that.operation);case _ExportSuccess() when exportSuccess != null:
return exportSuccess(_that.message);case _RestoreSuccess() when restoreSuccess != null:
return restoreSuccess(_that.restoredWordsCount,_that.message);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( BackupOperation operation)  processing,required TResult Function( String message)  exportSuccess,required TResult Function( int restoredWordsCount,  String message)  restoreSuccess,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Processing():
return processing(_that.operation);case _ExportSuccess():
return exportSuccess(_that.message);case _RestoreSuccess():
return restoreSuccess(_that.restoredWordsCount,_that.message);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( BackupOperation operation)?  processing,TResult? Function( String message)?  exportSuccess,TResult? Function( int restoredWordsCount,  String message)?  restoreSuccess,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Processing() when processing != null:
return processing(_that.operation);case _ExportSuccess() when exportSuccess != null:
return exportSuccess(_that.message);case _RestoreSuccess() when restoreSuccess != null:
return restoreSuccess(_that.restoredWordsCount,_that.message);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements BackupState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackupState.idle()';
}


}




/// @nodoc


class _Processing implements BackupState {
  const _Processing({required this.operation});
  

 final  BackupOperation operation;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingCopyWith<_Processing> get copyWith => __$ProcessingCopyWithImpl<_Processing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing&&(identical(other.operation, operation) || other.operation == operation));
}


@override
int get hashCode => Object.hash(runtimeType,operation);

@override
String toString() {
  return 'BackupState.processing(operation: $operation)';
}


}

/// @nodoc
abstract mixin class _$ProcessingCopyWith<$Res> implements $BackupStateCopyWith<$Res> {
  factory _$ProcessingCopyWith(_Processing value, $Res Function(_Processing) _then) = __$ProcessingCopyWithImpl;
@useResult
$Res call({
 BackupOperation operation
});




}
/// @nodoc
class __$ProcessingCopyWithImpl<$Res>
    implements _$ProcessingCopyWith<$Res> {
  __$ProcessingCopyWithImpl(this._self, this._then);

  final _Processing _self;
  final $Res Function(_Processing) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operation = null,}) {
  return _then(_Processing(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as BackupOperation,
  ));
}


}

/// @nodoc


class _ExportSuccess implements BackupState {
  const _ExportSuccess({required this.message});
  

 final  String message;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExportSuccessCopyWith<_ExportSuccess> get copyWith => __$ExportSuccessCopyWithImpl<_ExportSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExportSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BackupState.exportSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ExportSuccessCopyWith<$Res> implements $BackupStateCopyWith<$Res> {
  factory _$ExportSuccessCopyWith(_ExportSuccess value, $Res Function(_ExportSuccess) _then) = __$ExportSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ExportSuccessCopyWithImpl<$Res>
    implements _$ExportSuccessCopyWith<$Res> {
  __$ExportSuccessCopyWithImpl(this._self, this._then);

  final _ExportSuccess _self;
  final $Res Function(_ExportSuccess) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ExportSuccess(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RestoreSuccess implements BackupState {
  const _RestoreSuccess({required this.restoredWordsCount, required this.message});
  

 final  int restoredWordsCount;
 final  String message;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestoreSuccessCopyWith<_RestoreSuccess> get copyWith => __$RestoreSuccessCopyWithImpl<_RestoreSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreSuccess&&(identical(other.restoredWordsCount, restoredWordsCount) || other.restoredWordsCount == restoredWordsCount)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,restoredWordsCount,message);

@override
String toString() {
  return 'BackupState.restoreSuccess(restoredWordsCount: $restoredWordsCount, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RestoreSuccessCopyWith<$Res> implements $BackupStateCopyWith<$Res> {
  factory _$RestoreSuccessCopyWith(_RestoreSuccess value, $Res Function(_RestoreSuccess) _then) = __$RestoreSuccessCopyWithImpl;
@useResult
$Res call({
 int restoredWordsCount, String message
});




}
/// @nodoc
class __$RestoreSuccessCopyWithImpl<$Res>
    implements _$RestoreSuccessCopyWith<$Res> {
  __$RestoreSuccessCopyWithImpl(this._self, this._then);

  final _RestoreSuccess _self;
  final $Res Function(_RestoreSuccess) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? restoredWordsCount = null,Object? message = null,}) {
  return _then(_RestoreSuccess(
restoredWordsCount: null == restoredWordsCount ? _self.restoredWordsCount : restoredWordsCount // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements BackupState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BackupState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $BackupStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of BackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
