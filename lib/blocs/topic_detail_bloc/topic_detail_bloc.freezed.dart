// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicDetailEvent()';
}


}

/// @nodoc
class $TopicDetailEventCopyWith<$Res>  {
$TopicDetailEventCopyWith(TopicDetailEvent _, $Res Function(TopicDetailEvent) __);
}


/// Adds pattern-matching-related methods to [TopicDetailEvent].
extension TopicDetailEventPatterns on TopicDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ReloadRequested value)?  reloadRequested,TResult Function( _AddWordRequested value)?  addWordRequested,TResult Function( _ImportWordsRequested value)?  importWordsRequested,TResult Function( _DeleteTopicRequested value)?  deleteTopicRequested,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that);case _AddWordRequested() when addWordRequested != null:
return addWordRequested(_that);case _ImportWordsRequested() when importWordsRequested != null:
return importWordsRequested(_that);case _DeleteTopicRequested() when deleteTopicRequested != null:
return deleteTopicRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ReloadRequested value)  reloadRequested,required TResult Function( _AddWordRequested value)  addWordRequested,required TResult Function( _ImportWordsRequested value)  importWordsRequested,required TResult Function( _DeleteTopicRequested value)  deleteTopicRequested,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ReloadRequested():
return reloadRequested(_that);case _AddWordRequested():
return addWordRequested(_that);case _ImportWordsRequested():
return importWordsRequested(_that);case _DeleteTopicRequested():
return deleteTopicRequested(_that);case _StatusConsumed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ReloadRequested value)?  reloadRequested,TResult? Function( _AddWordRequested value)?  addWordRequested,TResult? Function( _ImportWordsRequested value)?  importWordsRequested,TResult? Function( _DeleteTopicRequested value)?  deleteTopicRequested,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ReloadRequested() when reloadRequested != null:
return reloadRequested(_that);case _AddWordRequested() when addWordRequested != null:
return addWordRequested(_that);case _ImportWordsRequested() when importWordsRequested != null:
return importWordsRequested(_that);case _DeleteTopicRequested() when deleteTopicRequested != null:
return deleteTopicRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int topicId,  String topicName)?  started,TResult Function()?  reloadRequested,TResult Function( Word newWord)?  addWordRequested,TResult Function()?  importWordsRequested,TResult Function()?  deleteTopicRequested,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.topicId,_that.topicName);case _ReloadRequested() when reloadRequested != null:
return reloadRequested();case _AddWordRequested() when addWordRequested != null:
return addWordRequested(_that.newWord);case _ImportWordsRequested() when importWordsRequested != null:
return importWordsRequested();case _DeleteTopicRequested() when deleteTopicRequested != null:
return deleteTopicRequested();case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int topicId,  String topicName)  started,required TResult Function()  reloadRequested,required TResult Function( Word newWord)  addWordRequested,required TResult Function()  importWordsRequested,required TResult Function()  deleteTopicRequested,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.topicId,_that.topicName);case _ReloadRequested():
return reloadRequested();case _AddWordRequested():
return addWordRequested(_that.newWord);case _ImportWordsRequested():
return importWordsRequested();case _DeleteTopicRequested():
return deleteTopicRequested();case _StatusConsumed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int topicId,  String topicName)?  started,TResult? Function()?  reloadRequested,TResult? Function( Word newWord)?  addWordRequested,TResult? Function()?  importWordsRequested,TResult? Function()?  deleteTopicRequested,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.topicId,_that.topicName);case _ReloadRequested() when reloadRequested != null:
return reloadRequested();case _AddWordRequested() when addWordRequested != null:
return addWordRequested(_that.newWord);case _ImportWordsRequested() when importWordsRequested != null:
return importWordsRequested();case _DeleteTopicRequested() when deleteTopicRequested != null:
return deleteTopicRequested();case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TopicDetailEvent {
  const _Started({required this.topicId, required this.topicName});
  

 final  int topicId;
 final  String topicName;

/// Create a copy of TopicDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicName, topicName) || other.topicName == topicName));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,topicName);

@override
String toString() {
  return 'TopicDetailEvent.started(topicId: $topicId, topicName: $topicName)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $TopicDetailEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 int topicId, String topicName
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of TopicDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? topicId = null,Object? topicName = null,}) {
  return _then(_Started(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ReloadRequested implements TopicDetailEvent {
  const _ReloadRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReloadRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicDetailEvent.reloadRequested()';
}


}




/// @nodoc


class _AddWordRequested implements TopicDetailEvent {
  const _AddWordRequested({required this.newWord});
  

 final  Word newWord;

/// Create a copy of TopicDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWordRequestedCopyWith<_AddWordRequested> get copyWith => __$AddWordRequestedCopyWithImpl<_AddWordRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWordRequested&&(identical(other.newWord, newWord) || other.newWord == newWord));
}


@override
int get hashCode => Object.hash(runtimeType,newWord);

@override
String toString() {
  return 'TopicDetailEvent.addWordRequested(newWord: $newWord)';
}


}

/// @nodoc
abstract mixin class _$AddWordRequestedCopyWith<$Res> implements $TopicDetailEventCopyWith<$Res> {
  factory _$AddWordRequestedCopyWith(_AddWordRequested value, $Res Function(_AddWordRequested) _then) = __$AddWordRequestedCopyWithImpl;
@useResult
$Res call({
 Word newWord
});




}
/// @nodoc
class __$AddWordRequestedCopyWithImpl<$Res>
    implements _$AddWordRequestedCopyWith<$Res> {
  __$AddWordRequestedCopyWithImpl(this._self, this._then);

  final _AddWordRequested _self;
  final $Res Function(_AddWordRequested) _then;

/// Create a copy of TopicDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newWord = null,}) {
  return _then(_AddWordRequested(
newWord: null == newWord ? _self.newWord : newWord // ignore: cast_nullable_to_non_nullable
as Word,
  ));
}


}

/// @nodoc


class _ImportWordsRequested implements TopicDetailEvent {
  const _ImportWordsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportWordsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicDetailEvent.importWordsRequested()';
}


}




/// @nodoc


class _DeleteTopicRequested implements TopicDetailEvent {
  const _DeleteTopicRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTopicRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicDetailEvent.deleteTopicRequested()';
}


}




/// @nodoc


class _StatusConsumed implements TopicDetailEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicDetailEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$TopicDetailState {

 int get topicId; String get topicName; List<Word> get words; bool get isLoading; bool get hasChanges; TopicDetailStatus get status; String? get message;
/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDetailStateCopyWith<TopicDetailState> get copyWith => _$TopicDetailStateCopyWithImpl<TopicDetailState>(this as TopicDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetailState&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&const DeepCollectionEquality().equals(other.words, words)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,topicName,const DeepCollectionEquality().hash(words),isLoading,hasChanges,status,message);

@override
String toString() {
  return 'TopicDetailState(topicId: $topicId, topicName: $topicName, words: $words, isLoading: $isLoading, hasChanges: $hasChanges, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $TopicDetailStateCopyWith<$Res>  {
  factory $TopicDetailStateCopyWith(TopicDetailState value, $Res Function(TopicDetailState) _then) = _$TopicDetailStateCopyWithImpl;
@useResult
$Res call({
 int topicId, String topicName, List<Word> words, bool isLoading, bool hasChanges, TopicDetailStatus status, String? message
});




}
/// @nodoc
class _$TopicDetailStateCopyWithImpl<$Res>
    implements $TopicDetailStateCopyWith<$Res> {
  _$TopicDetailStateCopyWithImpl(this._self, this._then);

  final TopicDetailState _self;
  final $Res Function(TopicDetailState) _then;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topicId = null,Object? topicName = null,Object? words = null,Object? isLoading = null,Object? hasChanges = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<Word>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicDetailState].
extension TopicDetailStatePatterns on TopicDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TopicDetailState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int topicId,  String topicName,  List<Word> words,  bool isLoading,  bool hasChanges,  TopicDetailStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.topicId,_that.topicName,_that.words,_that.isLoading,_that.hasChanges,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int topicId,  String topicName,  List<Word> words,  bool isLoading,  bool hasChanges,  TopicDetailStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState():
return $default(_that.topicId,_that.topicName,_that.words,_that.isLoading,_that.hasChanges,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int topicId,  String topicName,  List<Word> words,  bool isLoading,  bool hasChanges,  TopicDetailStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.topicId,_that.topicName,_that.words,_that.isLoading,_that.hasChanges,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TopicDetailState implements TopicDetailState {
  const _TopicDetailState({this.topicId = 0, this.topicName = '', final  List<Word> words = const <Word>[], this.isLoading = false, this.hasChanges = false, this.status = TopicDetailStatus.initial, this.message}): _words = words;
  

@override@JsonKey() final  int topicId;
@override@JsonKey() final  String topicName;
 final  List<Word> _words;
@override@JsonKey() List<Word> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasChanges;
@override@JsonKey() final  TopicDetailStatus status;
@override final  String? message;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDetailStateCopyWith<_TopicDetailState> get copyWith => __$TopicDetailStateCopyWithImpl<_TopicDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetailState&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&const DeepCollectionEquality().equals(other._words, _words)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,topicName,const DeepCollectionEquality().hash(_words),isLoading,hasChanges,status,message);

@override
String toString() {
  return 'TopicDetailState(topicId: $topicId, topicName: $topicName, words: $words, isLoading: $isLoading, hasChanges: $hasChanges, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailStateCopyWith<$Res> implements $TopicDetailStateCopyWith<$Res> {
  factory _$TopicDetailStateCopyWith(_TopicDetailState value, $Res Function(_TopicDetailState) _then) = __$TopicDetailStateCopyWithImpl;
@override @useResult
$Res call({
 int topicId, String topicName, List<Word> words, bool isLoading, bool hasChanges, TopicDetailStatus status, String? message
});




}
/// @nodoc
class __$TopicDetailStateCopyWithImpl<$Res>
    implements _$TopicDetailStateCopyWith<$Res> {
  __$TopicDetailStateCopyWithImpl(this._self, this._then);

  final _TopicDetailState _self;
  final $Res Function(_TopicDetailState) _then;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topicId = null,Object? topicName = null,Object? words = null,Object? isLoading = null,Object? hasChanges = null,Object? status = null,Object? message = freezed,}) {
  return _then(_TopicDetailState(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<Word>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
