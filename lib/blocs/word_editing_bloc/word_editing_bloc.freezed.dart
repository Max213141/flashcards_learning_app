// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_editing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WordEditingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordEditingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordEditingEvent()';
}


}

/// @nodoc
class $WordEditingEventCopyWith<$Res>  {
$WordEditingEventCopyWith(WordEditingEvent _, $Res Function(WordEditingEvent) __);
}


/// Adds pattern-matching-related methods to [WordEditingEvent].
extension WordEditingEventPatterns on WordEditingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SaveRequested value)?  saveRequested,TResult Function( _ToggleLearnedRequested value)?  toggleLearnedRequested,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _ToggleLearnedRequested() when toggleLearnedRequested != null:
return toggleLearnedRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SaveRequested value)  saveRequested,required TResult Function( _ToggleLearnedRequested value)  toggleLearnedRequested,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SaveRequested():
return saveRequested(_that);case _ToggleLearnedRequested():
return toggleLearnedRequested(_that);case _StatusConsumed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SaveRequested value)?  saveRequested,TResult? Function( _ToggleLearnedRequested value)?  toggleLearnedRequested,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveRequested() when saveRequested != null:
return saveRequested(_that);case _ToggleLearnedRequested() when toggleLearnedRequested != null:
return toggleLearnedRequested(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Word? word)?  started,TResult Function( Word updatedWord)?  saveRequested,TResult Function( Word word)?  toggleLearnedRequested,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.word);case _SaveRequested() when saveRequested != null:
return saveRequested(_that.updatedWord);case _ToggleLearnedRequested() when toggleLearnedRequested != null:
return toggleLearnedRequested(_that.word);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Word? word)  started,required TResult Function( Word updatedWord)  saveRequested,required TResult Function( Word word)  toggleLearnedRequested,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.word);case _SaveRequested():
return saveRequested(_that.updatedWord);case _ToggleLearnedRequested():
return toggleLearnedRequested(_that.word);case _StatusConsumed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Word? word)?  started,TResult? Function( Word updatedWord)?  saveRequested,TResult? Function( Word word)?  toggleLearnedRequested,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.word);case _SaveRequested() when saveRequested != null:
return saveRequested(_that.updatedWord);case _ToggleLearnedRequested() when toggleLearnedRequested != null:
return toggleLearnedRequested(_that.word);case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WordEditingEvent {
  const _Started({required this.word});
  

 final  Word? word;

/// Create a copy of WordEditingEvent
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
  return 'WordEditingEvent.started(word: $word)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $WordEditingEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 Word? word
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of WordEditingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? word = freezed,}) {
  return _then(_Started(
word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word?,
  ));
}


}

/// @nodoc


class _SaveRequested implements WordEditingEvent {
  const _SaveRequested({required this.updatedWord});
  

 final  Word updatedWord;

/// Create a copy of WordEditingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRequestedCopyWith<_SaveRequested> get copyWith => __$SaveRequestedCopyWithImpl<_SaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRequested&&(identical(other.updatedWord, updatedWord) || other.updatedWord == updatedWord));
}


@override
int get hashCode => Object.hash(runtimeType,updatedWord);

@override
String toString() {
  return 'WordEditingEvent.saveRequested(updatedWord: $updatedWord)';
}


}

/// @nodoc
abstract mixin class _$SaveRequestedCopyWith<$Res> implements $WordEditingEventCopyWith<$Res> {
  factory _$SaveRequestedCopyWith(_SaveRequested value, $Res Function(_SaveRequested) _then) = __$SaveRequestedCopyWithImpl;
@useResult
$Res call({
 Word updatedWord
});




}
/// @nodoc
class __$SaveRequestedCopyWithImpl<$Res>
    implements _$SaveRequestedCopyWith<$Res> {
  __$SaveRequestedCopyWithImpl(this._self, this._then);

  final _SaveRequested _self;
  final $Res Function(_SaveRequested) _then;

/// Create a copy of WordEditingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedWord = null,}) {
  return _then(_SaveRequested(
updatedWord: null == updatedWord ? _self.updatedWord : updatedWord // ignore: cast_nullable_to_non_nullable
as Word,
  ));
}


}

/// @nodoc


class _ToggleLearnedRequested implements WordEditingEvent {
  const _ToggleLearnedRequested({required this.word});
  

 final  Word word;

/// Create a copy of WordEditingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleLearnedRequestedCopyWith<_ToggleLearnedRequested> get copyWith => __$ToggleLearnedRequestedCopyWithImpl<_ToggleLearnedRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleLearnedRequested&&(identical(other.word, word) || other.word == word));
}


@override
int get hashCode => Object.hash(runtimeType,word);

@override
String toString() {
  return 'WordEditingEvent.toggleLearnedRequested(word: $word)';
}


}

/// @nodoc
abstract mixin class _$ToggleLearnedRequestedCopyWith<$Res> implements $WordEditingEventCopyWith<$Res> {
  factory _$ToggleLearnedRequestedCopyWith(_ToggleLearnedRequested value, $Res Function(_ToggleLearnedRequested) _then) = __$ToggleLearnedRequestedCopyWithImpl;
@useResult
$Res call({
 Word word
});




}
/// @nodoc
class __$ToggleLearnedRequestedCopyWithImpl<$Res>
    implements _$ToggleLearnedRequestedCopyWith<$Res> {
  __$ToggleLearnedRequestedCopyWithImpl(this._self, this._then);

  final _ToggleLearnedRequested _self;
  final $Res Function(_ToggleLearnedRequested) _then;

/// Create a copy of WordEditingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? word = null,}) {
  return _then(_ToggleLearnedRequested(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word,
  ));
}


}

/// @nodoc


class _StatusConsumed implements WordEditingEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WordEditingEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$WordEditingState {

 Word? get word; bool get isSaving; WordEditingStatus get status; String? get message;
/// Create a copy of WordEditingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordEditingStateCopyWith<WordEditingState> get copyWith => _$WordEditingStateCopyWithImpl<WordEditingState>(this as WordEditingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordEditingState&&(identical(other.word, word) || other.word == word)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,word,isSaving,status,message);

@override
String toString() {
  return 'WordEditingState(word: $word, isSaving: $isSaving, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $WordEditingStateCopyWith<$Res>  {
  factory $WordEditingStateCopyWith(WordEditingState value, $Res Function(WordEditingState) _then) = _$WordEditingStateCopyWithImpl;
@useResult
$Res call({
 Word? word, bool isSaving, WordEditingStatus status, String? message
});




}
/// @nodoc
class _$WordEditingStateCopyWithImpl<$Res>
    implements $WordEditingStateCopyWith<$Res> {
  _$WordEditingStateCopyWithImpl(this._self, this._then);

  final WordEditingState _self;
  final $Res Function(WordEditingState) _then;

/// Create a copy of WordEditingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = freezed,Object? isSaving = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WordEditingStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordEditingState].
extension WordEditingStatePatterns on WordEditingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordEditingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordEditingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordEditingState value)  $default,){
final _that = this;
switch (_that) {
case _WordEditingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordEditingState value)?  $default,){
final _that = this;
switch (_that) {
case _WordEditingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Word? word,  bool isSaving,  WordEditingStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordEditingState() when $default != null:
return $default(_that.word,_that.isSaving,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Word? word,  bool isSaving,  WordEditingStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _WordEditingState():
return $default(_that.word,_that.isSaving,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Word? word,  bool isSaving,  WordEditingStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _WordEditingState() when $default != null:
return $default(_that.word,_that.isSaving,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _WordEditingState implements WordEditingState {
  const _WordEditingState({this.word, this.isSaving = false, this.status = WordEditingStatus.initial, this.message});
  

@override final  Word? word;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  WordEditingStatus status;
@override final  String? message;

/// Create a copy of WordEditingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordEditingStateCopyWith<_WordEditingState> get copyWith => __$WordEditingStateCopyWithImpl<_WordEditingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordEditingState&&(identical(other.word, word) || other.word == word)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,word,isSaving,status,message);

@override
String toString() {
  return 'WordEditingState(word: $word, isSaving: $isSaving, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$WordEditingStateCopyWith<$Res> implements $WordEditingStateCopyWith<$Res> {
  factory _$WordEditingStateCopyWith(_WordEditingState value, $Res Function(_WordEditingState) _then) = __$WordEditingStateCopyWithImpl;
@override @useResult
$Res call({
 Word? word, bool isSaving, WordEditingStatus status, String? message
});




}
/// @nodoc
class __$WordEditingStateCopyWithImpl<$Res>
    implements _$WordEditingStateCopyWith<$Res> {
  __$WordEditingStateCopyWithImpl(this._self, this._then);

  final _WordEditingState _self;
  final $Res Function(_WordEditingState) _then;

/// Create a copy of WordEditingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = freezed,Object? isSaving = null,Object? status = null,Object? message = freezed,}) {
  return _then(_WordEditingState(
word: freezed == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as Word?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WordEditingStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
