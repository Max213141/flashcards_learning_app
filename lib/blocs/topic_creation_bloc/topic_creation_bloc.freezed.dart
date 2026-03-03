// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_creation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicCreationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicCreationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicCreationEvent()';
}


}

/// @nodoc
class $TopicCreationEventCopyWith<$Res>  {
$TopicCreationEventCopyWith(TopicCreationEvent _, $Res Function(TopicCreationEvent) __);
}


/// Adds pattern-matching-related methods to [TopicCreationEvent].
extension TopicCreationEventPatterns on TopicCreationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NameChanged value)?  nameChanged,TResult Function( _ColorChanged value)?  colorChanged,TResult Function( _TopicSuggestionSelected value)?  topicSuggestionSelected,TResult Function( _JsonImportRequested value)?  jsonImportRequested,TResult Function( _CreateSubmitted value)?  createSubmitted,TResult Function( _StatusConsumed value)?  statusConsumed,TResult Function( _ResetRequested value)?  resetRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorChanged() when colorChanged != null:
return colorChanged(_that);case _TopicSuggestionSelected() when topicSuggestionSelected != null:
return topicSuggestionSelected(_that);case _JsonImportRequested() when jsonImportRequested != null:
return jsonImportRequested(_that);case _CreateSubmitted() when createSubmitted != null:
return createSubmitted(_that);case _StatusConsumed() when statusConsumed != null:
return statusConsumed(_that);case _ResetRequested() when resetRequested != null:
return resetRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _ColorChanged value)  colorChanged,required TResult Function( _TopicSuggestionSelected value)  topicSuggestionSelected,required TResult Function( _JsonImportRequested value)  jsonImportRequested,required TResult Function( _CreateSubmitted value)  createSubmitted,required TResult Function( _StatusConsumed value)  statusConsumed,required TResult Function( _ResetRequested value)  resetRequested,}){
final _that = this;
switch (_that) {
case _NameChanged():
return nameChanged(_that);case _ColorChanged():
return colorChanged(_that);case _TopicSuggestionSelected():
return topicSuggestionSelected(_that);case _JsonImportRequested():
return jsonImportRequested(_that);case _CreateSubmitted():
return createSubmitted(_that);case _StatusConsumed():
return statusConsumed(_that);case _ResetRequested():
return resetRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _ColorChanged value)?  colorChanged,TResult? Function( _TopicSuggestionSelected value)?  topicSuggestionSelected,TResult? Function( _JsonImportRequested value)?  jsonImportRequested,TResult? Function( _CreateSubmitted value)?  createSubmitted,TResult? Function( _StatusConsumed value)?  statusConsumed,TResult? Function( _ResetRequested value)?  resetRequested,}){
final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _ColorChanged() when colorChanged != null:
return colorChanged(_that);case _TopicSuggestionSelected() when topicSuggestionSelected != null:
return topicSuggestionSelected(_that);case _JsonImportRequested() when jsonImportRequested != null:
return jsonImportRequested(_that);case _CreateSubmitted() when createSubmitted != null:
return createSubmitted(_that);case _StatusConsumed() when statusConsumed != null:
return statusConsumed(_that);case _ResetRequested() when resetRequested != null:
return resetRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  nameChanged,TResult Function( int colorValue)?  colorChanged,TResult Function( String name)?  topicSuggestionSelected,TResult Function()?  jsonImportRequested,TResult Function()?  createSubmitted,TResult Function()?  statusConsumed,TResult Function()?  resetRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorChanged() when colorChanged != null:
return colorChanged(_that.colorValue);case _TopicSuggestionSelected() when topicSuggestionSelected != null:
return topicSuggestionSelected(_that.name);case _JsonImportRequested() when jsonImportRequested != null:
return jsonImportRequested();case _CreateSubmitted() when createSubmitted != null:
return createSubmitted();case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _ResetRequested() when resetRequested != null:
return resetRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  nameChanged,required TResult Function( int colorValue)  colorChanged,required TResult Function( String name)  topicSuggestionSelected,required TResult Function()  jsonImportRequested,required TResult Function()  createSubmitted,required TResult Function()  statusConsumed,required TResult Function()  resetRequested,}) {final _that = this;
switch (_that) {
case _NameChanged():
return nameChanged(_that.name);case _ColorChanged():
return colorChanged(_that.colorValue);case _TopicSuggestionSelected():
return topicSuggestionSelected(_that.name);case _JsonImportRequested():
return jsonImportRequested();case _CreateSubmitted():
return createSubmitted();case _StatusConsumed():
return statusConsumed();case _ResetRequested():
return resetRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  nameChanged,TResult? Function( int colorValue)?  colorChanged,TResult? Function( String name)?  topicSuggestionSelected,TResult? Function()?  jsonImportRequested,TResult? Function()?  createSubmitted,TResult? Function()?  statusConsumed,TResult? Function()?  resetRequested,}) {final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _ColorChanged() when colorChanged != null:
return colorChanged(_that.colorValue);case _TopicSuggestionSelected() when topicSuggestionSelected != null:
return topicSuggestionSelected(_that.name);case _JsonImportRequested() when jsonImportRequested != null:
return jsonImportRequested();case _CreateSubmitted() when createSubmitted != null:
return createSubmitted();case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _ResetRequested() when resetRequested != null:
return resetRequested();case _:
  return null;

}
}

}

/// @nodoc


class _NameChanged implements TopicCreationEvent {
  const _NameChanged({required this.name});
  

 final  String name;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangedCopyWith<_NameChanged> get copyWith => __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'TopicCreationEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $TopicCreationEventCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) _then) = __$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(this._self, this._then);

  final _NameChanged _self;
  final $Res Function(_NameChanged) _then;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_NameChanged(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ColorChanged implements TopicCreationEvent {
  const _ColorChanged({required this.colorValue});
  

 final  int colorValue;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorChangedCopyWith<_ColorChanged> get copyWith => __$ColorChangedCopyWithImpl<_ColorChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorChanged&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,colorValue);

@override
String toString() {
  return 'TopicCreationEvent.colorChanged(colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class _$ColorChangedCopyWith<$Res> implements $TopicCreationEventCopyWith<$Res> {
  factory _$ColorChangedCopyWith(_ColorChanged value, $Res Function(_ColorChanged) _then) = __$ColorChangedCopyWithImpl;
@useResult
$Res call({
 int colorValue
});




}
/// @nodoc
class __$ColorChangedCopyWithImpl<$Res>
    implements _$ColorChangedCopyWith<$Res> {
  __$ColorChangedCopyWithImpl(this._self, this._then);

  final _ColorChanged _self;
  final $Res Function(_ColorChanged) _then;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? colorValue = null,}) {
  return _then(_ColorChanged(
colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _TopicSuggestionSelected implements TopicCreationEvent {
  const _TopicSuggestionSelected({required this.name});
  

 final  String name;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicSuggestionSelectedCopyWith<_TopicSuggestionSelected> get copyWith => __$TopicSuggestionSelectedCopyWithImpl<_TopicSuggestionSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicSuggestionSelected&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'TopicCreationEvent.topicSuggestionSelected(name: $name)';
}


}

/// @nodoc
abstract mixin class _$TopicSuggestionSelectedCopyWith<$Res> implements $TopicCreationEventCopyWith<$Res> {
  factory _$TopicSuggestionSelectedCopyWith(_TopicSuggestionSelected value, $Res Function(_TopicSuggestionSelected) _then) = __$TopicSuggestionSelectedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$TopicSuggestionSelectedCopyWithImpl<$Res>
    implements _$TopicSuggestionSelectedCopyWith<$Res> {
  __$TopicSuggestionSelectedCopyWithImpl(this._self, this._then);

  final _TopicSuggestionSelected _self;
  final $Res Function(_TopicSuggestionSelected) _then;

/// Create a copy of TopicCreationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_TopicSuggestionSelected(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _JsonImportRequested implements TopicCreationEvent {
  const _JsonImportRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonImportRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicCreationEvent.jsonImportRequested()';
}


}




/// @nodoc


class _CreateSubmitted implements TopicCreationEvent {
  const _CreateSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicCreationEvent.createSubmitted()';
}


}




/// @nodoc


class _StatusConsumed implements TopicCreationEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicCreationEvent.statusConsumed()';
}


}




/// @nodoc


class _ResetRequested implements TopicCreationEvent {
  const _ResetRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicCreationEvent.resetRequested()';
}


}




/// @nodoc
mixin _$TopicCreationState {

 String get name; int get selectedColorValue; List<Word> get importedWords; List<String> get topicSuggestions; bool get isLoading; TopicCreationStatus get status; String? get message;
/// Create a copy of TopicCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicCreationStateCopyWith<TopicCreationState> get copyWith => _$TopicCreationStateCopyWithImpl<TopicCreationState>(this as TopicCreationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicCreationState&&(identical(other.name, name) || other.name == name)&&(identical(other.selectedColorValue, selectedColorValue) || other.selectedColorValue == selectedColorValue)&&const DeepCollectionEquality().equals(other.importedWords, importedWords)&&const DeepCollectionEquality().equals(other.topicSuggestions, topicSuggestions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,selectedColorValue,const DeepCollectionEquality().hash(importedWords),const DeepCollectionEquality().hash(topicSuggestions),isLoading,status,message);

@override
String toString() {
  return 'TopicCreationState(name: $name, selectedColorValue: $selectedColorValue, importedWords: $importedWords, topicSuggestions: $topicSuggestions, isLoading: $isLoading, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $TopicCreationStateCopyWith<$Res>  {
  factory $TopicCreationStateCopyWith(TopicCreationState value, $Res Function(TopicCreationState) _then) = _$TopicCreationStateCopyWithImpl;
@useResult
$Res call({
 String name, int selectedColorValue, List<Word> importedWords, List<String> topicSuggestions, bool isLoading, TopicCreationStatus status, String? message
});




}
/// @nodoc
class _$TopicCreationStateCopyWithImpl<$Res>
    implements $TopicCreationStateCopyWith<$Res> {
  _$TopicCreationStateCopyWithImpl(this._self, this._then);

  final TopicCreationState _self;
  final $Res Function(TopicCreationState) _then;

/// Create a copy of TopicCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? selectedColorValue = null,Object? importedWords = null,Object? topicSuggestions = null,Object? isLoading = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,selectedColorValue: null == selectedColorValue ? _self.selectedColorValue : selectedColorValue // ignore: cast_nullable_to_non_nullable
as int,importedWords: null == importedWords ? _self.importedWords : importedWords // ignore: cast_nullable_to_non_nullable
as List<Word>,topicSuggestions: null == topicSuggestions ? _self.topicSuggestions : topicSuggestions // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicCreationStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicCreationState].
extension TopicCreationStatePatterns on TopicCreationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicCreationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicCreationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicCreationState value)  $default,){
final _that = this;
switch (_that) {
case _TopicCreationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicCreationState value)?  $default,){
final _that = this;
switch (_that) {
case _TopicCreationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int selectedColorValue,  List<Word> importedWords,  List<String> topicSuggestions,  bool isLoading,  TopicCreationStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicCreationState() when $default != null:
return $default(_that.name,_that.selectedColorValue,_that.importedWords,_that.topicSuggestions,_that.isLoading,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int selectedColorValue,  List<Word> importedWords,  List<String> topicSuggestions,  bool isLoading,  TopicCreationStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _TopicCreationState():
return $default(_that.name,_that.selectedColorValue,_that.importedWords,_that.topicSuggestions,_that.isLoading,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int selectedColorValue,  List<Word> importedWords,  List<String> topicSuggestions,  bool isLoading,  TopicCreationStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _TopicCreationState() when $default != null:
return $default(_that.name,_that.selectedColorValue,_that.importedWords,_that.topicSuggestions,_that.isLoading,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _TopicCreationState implements TopicCreationState {
  const _TopicCreationState({this.name = '', this.selectedColorValue = AppConst.yellowInt, final  List<Word> importedWords = const <Word>[], final  List<String> topicSuggestions = const <String>[], this.isLoading = false, this.status = TopicCreationStatus.idle, this.message}): _importedWords = importedWords,_topicSuggestions = topicSuggestions;
  

@override@JsonKey() final  String name;
@override@JsonKey() final  int selectedColorValue;
 final  List<Word> _importedWords;
@override@JsonKey() List<Word> get importedWords {
  if (_importedWords is EqualUnmodifiableListView) return _importedWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_importedWords);
}

 final  List<String> _topicSuggestions;
@override@JsonKey() List<String> get topicSuggestions {
  if (_topicSuggestions is EqualUnmodifiableListView) return _topicSuggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topicSuggestions);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  TopicCreationStatus status;
@override final  String? message;

/// Create a copy of TopicCreationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicCreationStateCopyWith<_TopicCreationState> get copyWith => __$TopicCreationStateCopyWithImpl<_TopicCreationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicCreationState&&(identical(other.name, name) || other.name == name)&&(identical(other.selectedColorValue, selectedColorValue) || other.selectedColorValue == selectedColorValue)&&const DeepCollectionEquality().equals(other._importedWords, _importedWords)&&const DeepCollectionEquality().equals(other._topicSuggestions, _topicSuggestions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,selectedColorValue,const DeepCollectionEquality().hash(_importedWords),const DeepCollectionEquality().hash(_topicSuggestions),isLoading,status,message);

@override
String toString() {
  return 'TopicCreationState(name: $name, selectedColorValue: $selectedColorValue, importedWords: $importedWords, topicSuggestions: $topicSuggestions, isLoading: $isLoading, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TopicCreationStateCopyWith<$Res> implements $TopicCreationStateCopyWith<$Res> {
  factory _$TopicCreationStateCopyWith(_TopicCreationState value, $Res Function(_TopicCreationState) _then) = __$TopicCreationStateCopyWithImpl;
@override @useResult
$Res call({
 String name, int selectedColorValue, List<Word> importedWords, List<String> topicSuggestions, bool isLoading, TopicCreationStatus status, String? message
});




}
/// @nodoc
class __$TopicCreationStateCopyWithImpl<$Res>
    implements _$TopicCreationStateCopyWith<$Res> {
  __$TopicCreationStateCopyWithImpl(this._self, this._then);

  final _TopicCreationState _self;
  final $Res Function(_TopicCreationState) _then;

/// Create a copy of TopicCreationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? selectedColorValue = null,Object? importedWords = null,Object? topicSuggestions = null,Object? isLoading = null,Object? status = null,Object? message = freezed,}) {
  return _then(_TopicCreationState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,selectedColorValue: null == selectedColorValue ? _self.selectedColorValue : selectedColorValue // ignore: cast_nullable_to_non_nullable
as int,importedWords: null == importedWords ? _self._importedWords : importedWords // ignore: cast_nullable_to_non_nullable
as List<Word>,topicSuggestions: null == topicSuggestions ? _self._topicSuggestions : topicSuggestions // ignore: cast_nullable_to_non_nullable
as List<String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicCreationStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
