// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocaleEvent()';
}


}

/// @nodoc
class $LocaleEventCopyWith<$Res>  {
$LocaleEventCopyWith(LocaleEvent _, $Res Function(LocaleEvent) __);
}


/// Adds pattern-matching-related methods to [LocaleEvent].
extension LocaleEventPatterns on LocaleEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LocaleChanged value)?  localeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LocaleChanged value)  localeChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LocaleChanged():
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LocaleChanged value)?  localeChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Locale locale)?  localeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Locale locale)  localeChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LocaleChanged():
return localeChanged(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Locale locale)?  localeChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LocaleEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocaleEvent.started()';
}


}




/// @nodoc


class _LocaleChanged implements LocaleEvent {
  const _LocaleChanged({required this.locale});
  

 final  Locale locale;

/// Create a copy of LocaleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleChangedCopyWith<_LocaleChanged> get copyWith => __$LocaleChangedCopyWithImpl<_LocaleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleChanged&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocaleEvent.localeChanged(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocaleChangedCopyWith<$Res> implements $LocaleEventCopyWith<$Res> {
  factory _$LocaleChangedCopyWith(_LocaleChanged value, $Res Function(_LocaleChanged) _then) = __$LocaleChangedCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class __$LocaleChangedCopyWithImpl<$Res>
    implements _$LocaleChangedCopyWith<$Res> {
  __$LocaleChangedCopyWithImpl(this._self, this._then);

  final _LocaleChanged _self;
  final $Res Function(_LocaleChanged) _then;

/// Create a copy of LocaleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_LocaleChanged(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

/// @nodoc
mixin _$LocaleState {

 Locale get locale;
/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleStateCopyWith<LocaleState> get copyWith => _$LocaleStateCopyWithImpl<LocaleState>(this as LocaleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocaleState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocaleStateCopyWith<$Res>  {
  factory $LocaleStateCopyWith(LocaleState value, $Res Function(LocaleState) _then) = _$LocaleStateCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class _$LocaleStateCopyWithImpl<$Res>
    implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._self, this._then);

  final LocaleState _self;
  final $Res Function(LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}

}


/// Adds pattern-matching-related methods to [LocaleState].
extension LocaleStatePatterns on LocaleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocaleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocaleState value)  $default,){
final _that = this;
switch (_that) {
case _LocaleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocaleState value)?  $default,){
final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Locale locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
return $default(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Locale locale)  $default,) {final _that = this;
switch (_that) {
case _LocaleState():
return $default(_that.locale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Locale locale)?  $default,) {final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
return $default(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _LocaleState implements LocaleState {
  const _LocaleState({required this.locale});
  

@override final  Locale locale;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleStateCopyWith<_LocaleState> get copyWith => __$LocaleStateCopyWithImpl<_LocaleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocaleState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocaleStateCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$LocaleStateCopyWith(_LocaleState value, $Res Function(_LocaleState) _then) = __$LocaleStateCopyWithImpl;
@override @useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class __$LocaleStateCopyWithImpl<$Res>
    implements _$LocaleStateCopyWith<$Res> {
  __$LocaleStateCopyWithImpl(this._self, this._then);

  final _LocaleState _self;
  final $Res Function(_LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_LocaleState(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on
