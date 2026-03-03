// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestEvent()';
}


}

/// @nodoc
class $TestEventCopyWith<$Res>  {
$TestEventCopyWith(TestEvent _, $Res Function(TestEvent) __);
}


/// Adds pattern-matching-related methods to [TestEvent].
extension TestEventPatterns on TestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ReloadRequested value)?  reloadRequested,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ReloadRequested value)  reloadRequested,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ReloadRequested():
return reloadRequested(_that);case _StatusConsumed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ReloadRequested value)?  reloadRequested,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int topicId)?  started,TResult Function( int topicId)?  reloadRequested,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.topicId);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that.topicId);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int topicId)  started,required TResult Function( int topicId)  reloadRequested,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.topicId);case _ReloadRequested():
return reloadRequested(_that.topicId);case _StatusConsumed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int topicId)?  started,TResult? Function( int topicId)?  reloadRequested,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.topicId);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that.topicId);case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TestEvent {
  const _Started({required this.topicId});
  

 final  int topicId;

/// Create a copy of TestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.topicId, topicId) || other.topicId == topicId));
}


@override
int get hashCode => Object.hash(runtimeType,topicId);

@override
String toString() {
  return 'TestEvent.started(topicId: $topicId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $TestEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 int topicId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of TestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicId = null,}) {
  return _then(_Started(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ReloadRequested implements TestEvent {
  const _ReloadRequested({required this.topicId});
  

 final  int topicId;

/// Create a copy of TestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReloadRequestedCopyWith<_ReloadRequested> get copyWith => __$ReloadRequestedCopyWithImpl<_ReloadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReloadRequested&&(identical(other.topicId, topicId) || other.topicId == topicId));
}


@override
int get hashCode => Object.hash(runtimeType,topicId);

@override
String toString() {
  return 'TestEvent.reloadRequested(topicId: $topicId)';
}


}

/// @nodoc
abstract mixin class _$ReloadRequestedCopyWith<$Res> implements $TestEventCopyWith<$Res> {
  factory _$ReloadRequestedCopyWith(_ReloadRequested value, $Res Function(_ReloadRequested) _then) = __$ReloadRequestedCopyWithImpl;
@useResult
$Res call({
 int topicId
});




}
/// @nodoc
class __$ReloadRequestedCopyWithImpl<$Res>
    implements _$ReloadRequestedCopyWith<$Res> {
  __$ReloadRequestedCopyWithImpl(this._self, this._then);

  final _ReloadRequested _self;
  final $Res Function(_ReloadRequested) _then;

/// Create a copy of TestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicId = null,}) {
  return _then(_ReloadRequested(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StatusConsumed implements TestEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$TestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestState()';
}


}

/// @nodoc
class $TestStateCopyWith<$Res>  {
$TestStateCopyWith(TestState _, $Res Function(TestState) __);
}


/// Adds pattern-matching-related methods to [TestState].
extension TestStatePatterns on TestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int topicId,  List<Word> words)?  loaded,TResult Function( int topicId,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.topicId,_that.words);case _Failure() when failure != null:
return failure(_that.topicId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int topicId,  List<Word> words)  loaded,required TResult Function( int topicId,  String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.topicId,_that.words);case _Failure():
return failure(_that.topicId,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int topicId,  List<Word> words)?  loaded,TResult? Function( int topicId,  String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.topicId,_that.words);case _Failure() when failure != null:
return failure(_that.topicId,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TestState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestState.initial()';
}


}




/// @nodoc


class _Loading implements TestState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TestState.loading()';
}


}




/// @nodoc


class _Loaded implements TestState {
  const _Loaded({required this.topicId, required final  List<Word> words}): _words = words;
  

 final  int topicId;
 final  List<Word> _words;
 List<Word> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of TestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.topicId, topicId) || other.topicId == topicId)&&const DeepCollectionEquality().equals(other._words, _words));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,const DeepCollectionEquality().hash(_words));

@override
String toString() {
  return 'TestState.loaded(topicId: $topicId, words: $words)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TestStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 int topicId, List<Word> words
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicId = null,Object? words = null,}) {
  return _then(_Loaded(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<Word>,
  ));
}


}

/// @nodoc


class _Failure implements TestState {
  const _Failure({required this.topicId, required this.message});
  

 final  int topicId;
 final  String message;

/// Create a copy of TestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,message);

@override
String toString() {
  return 'TestState.failure(topicId: $topicId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $TestStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 int topicId, String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of TestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicId = null,Object? message = null,}) {
  return _then(_Failure(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
