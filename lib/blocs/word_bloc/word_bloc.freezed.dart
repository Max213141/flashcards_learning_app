// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordEvent()';
}


}

/// @nodoc
class $WordEventCopyWith<$Res>  {
$WordEventCopyWith(WordEvent _, $Res Function(WordEvent) __);
}


/// Adds pattern-matching-related methods to [WordEvent].
extension WordEventPatterns on WordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddWord value)?  addWord,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _DeleteRequested value)?  deleteRequested,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddWord() when addWord != null:
return addWord(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddWord value)  addWord,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _DeleteRequested value)  deleteRequested,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddWord():
return addWord(_that);case _RefreshRequested():
return refreshRequested(_that);case _DeleteRequested():
return deleteRequested(_that);case _StatusConsumed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddWord value)?  addWord,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _DeleteRequested value)?  deleteRequested,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddWord() when addWord != null:
return addWord(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Word word)?  started,TResult Function( Word newWord)?  addWord,TResult Function( int wordId)?  refreshRequested,TResult Function( int? wordId)?  deleteRequested,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.word);case _AddWord() when addWord != null:
return addWord(_that.newWord);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that.wordId);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.wordId);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Word word)  started,required TResult Function( Word newWord)  addWord,required TResult Function( int wordId)  refreshRequested,required TResult Function( int? wordId)  deleteRequested,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.word);case _AddWord():
return addWord(_that.newWord);case _RefreshRequested():
return refreshRequested(_that.wordId);case _DeleteRequested():
return deleteRequested(_that.wordId);case _StatusConsumed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Word word)?  started,TResult? Function( Word newWord)?  addWord,TResult? Function( int wordId)?  refreshRequested,TResult? Function( int? wordId)?  deleteRequested,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.word);case _AddWord() when addWord != null:
return addWord(_that.newWord);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that.wordId);case _DeleteRequested() when deleteRequested != null:
return deleteRequested(_that.wordId);case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WordEvent {
  const _Started({required this.word});
  

 final  Word word;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.word, word) || other.word == word));
}


@override
int get hashCode => Object.hash(runtimeType,word);

@override
String toString() {
  return 'WordEvent.started(word: $word)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $WordEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 Word word
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? word = null,}) {
  return _then(_Started(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word,
  ));
}


}

/// @nodoc


class _AddWord implements WordEvent {
  const _AddWord({required this.newWord});
  

 final  Word newWord;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWordCopyWith<_AddWord> get copyWith => __$AddWordCopyWithImpl<_AddWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWord&&(identical(other.newWord, newWord) || other.newWord == newWord));
}


@override
int get hashCode => Object.hash(runtimeType,newWord);

@override
String toString() {
  return 'WordEvent.addWord(newWord: $newWord)';
}


}

/// @nodoc
abstract mixin class _$AddWordCopyWith<$Res> implements $WordEventCopyWith<$Res> {
  factory _$AddWordCopyWith(_AddWord value, $Res Function(_AddWord) _then) = __$AddWordCopyWithImpl;
@useResult
$Res call({
 Word newWord
});




}
/// @nodoc
class __$AddWordCopyWithImpl<$Res>
    implements _$AddWordCopyWith<$Res> {
  __$AddWordCopyWithImpl(this._self, this._then);

  final _AddWord _self;
  final $Res Function(_AddWord) _then;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newWord = null,}) {
  return _then(_AddWord(
newWord: null == newWord ? _self.newWord : newWord // ignore: cast_nullable_to_non_nullable
as Word,
  ));
}


}

/// @nodoc


class _RefreshRequested implements WordEvent {
  const _RefreshRequested({required this.wordId});
  

 final  int wordId;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshRequestedCopyWith<_RefreshRequested> get copyWith => __$RefreshRequestedCopyWithImpl<_RefreshRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested&&(identical(other.wordId, wordId) || other.wordId == wordId));
}


@override
int get hashCode => Object.hash(runtimeType,wordId);

@override
String toString() {
  return 'WordEvent.refreshRequested(wordId: $wordId)';
}


}

/// @nodoc
abstract mixin class _$RefreshRequestedCopyWith<$Res> implements $WordEventCopyWith<$Res> {
  factory _$RefreshRequestedCopyWith(_RefreshRequested value, $Res Function(_RefreshRequested) _then) = __$RefreshRequestedCopyWithImpl;
@useResult
$Res call({
 int wordId
});




}
/// @nodoc
class __$RefreshRequestedCopyWithImpl<$Res>
    implements _$RefreshRequestedCopyWith<$Res> {
  __$RefreshRequestedCopyWithImpl(this._self, this._then);

  final _RefreshRequested _self;
  final $Res Function(_RefreshRequested) _then;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wordId = null,}) {
  return _then(_RefreshRequested(
wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteRequested implements WordEvent {
  const _DeleteRequested({this.wordId});
  

 final  int? wordId;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteRequestedCopyWith<_DeleteRequested> get copyWith => __$DeleteRequestedCopyWithImpl<_DeleteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteRequested&&(identical(other.wordId, wordId) || other.wordId == wordId));
}


@override
int get hashCode => Object.hash(runtimeType,wordId);

@override
String toString() {
  return 'WordEvent.deleteRequested(wordId: $wordId)';
}


}

/// @nodoc
abstract mixin class _$DeleteRequestedCopyWith<$Res> implements $WordEventCopyWith<$Res> {
  factory _$DeleteRequestedCopyWith(_DeleteRequested value, $Res Function(_DeleteRequested) _then) = __$DeleteRequestedCopyWithImpl;
@useResult
$Res call({
 int? wordId
});




}
/// @nodoc
class __$DeleteRequestedCopyWithImpl<$Res>
    implements _$DeleteRequestedCopyWith<$Res> {
  __$DeleteRequestedCopyWithImpl(this._self, this._then);

  final _DeleteRequested _self;
  final $Res Function(_DeleteRequested) _then;

/// Create a copy of WordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wordId = freezed,}) {
  return _then(_DeleteRequested(
wordId: freezed == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _StatusConsumed implements WordEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$WordState {

 Word? get word; bool get isLoading; bool get hasChanges; WordStatus get status; String? get message;
/// Create a copy of WordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordStateCopyWith<WordState> get copyWith => _$WordStateCopyWithImpl<WordState>(this as WordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordState&&(identical(other.word, word) || other.word == word)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,word,isLoading,hasChanges,status,message);

@override
String toString() {
  return 'WordState(word: $word, isLoading: $isLoading, hasChanges: $hasChanges, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $WordStateCopyWith<$Res>  {
  factory $WordStateCopyWith(WordState value, $Res Function(WordState) _then) = _$WordStateCopyWithImpl;
@useResult
$Res call({
 Word? word, bool isLoading, bool hasChanges, WordStatus status, String? message
});




}
/// @nodoc
class _$WordStateCopyWithImpl<$Res>
    implements $WordStateCopyWith<$Res> {
  _$WordStateCopyWithImpl(this._self, this._then);

  final WordState _self;
  final $Res Function(WordState) _then;

/// Create a copy of WordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = freezed,Object? isLoading = null,Object? hasChanges = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WordStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordState].
extension WordStatePatterns on WordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordState value)  $default,){
final _that = this;
switch (_that) {
case _WordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordState value)?  $default,){
final _that = this;
switch (_that) {
case _WordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Word? word,  bool isLoading,  bool hasChanges,  WordStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordState() when $default != null:
return $default(_that.word,_that.isLoading,_that.hasChanges,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Word? word,  bool isLoading,  bool hasChanges,  WordStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _WordState():
return $default(_that.word,_that.isLoading,_that.hasChanges,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Word? word,  bool isLoading,  bool hasChanges,  WordStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _WordState() when $default != null:
return $default(_that.word,_that.isLoading,_that.hasChanges,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _WordState implements WordState {
  const _WordState({this.word, this.isLoading = false, this.hasChanges = false, this.status = WordStatus.initial, this.message});
  

@override final  Word? word;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasChanges;
@override@JsonKey() final  WordStatus status;
@override final  String? message;

/// Create a copy of WordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordStateCopyWith<_WordState> get copyWith => __$WordStateCopyWithImpl<_WordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordState&&(identical(other.word, word) || other.word == word)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,word,isLoading,hasChanges,status,message);

@override
String toString() {
  return 'WordState(word: $word, isLoading: $isLoading, hasChanges: $hasChanges, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$WordStateCopyWith<$Res> implements $WordStateCopyWith<$Res> {
  factory _$WordStateCopyWith(_WordState value, $Res Function(_WordState) _then) = __$WordStateCopyWithImpl;
@override @useResult
$Res call({
 Word? word, bool isLoading, bool hasChanges, WordStatus status, String? message
});




}
/// @nodoc
class __$WordStateCopyWithImpl<$Res>
    implements _$WordStateCopyWith<$Res> {
  __$WordStateCopyWithImpl(this._self, this._then);

  final _WordState _self;
  final $Res Function(_WordState) _then;

/// Create a copy of WordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = freezed,Object? isLoading = null,Object? hasChanges = null,Object? status = null,Object? message = freezed,}) {
  return _then(_WordState(
word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WordStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
