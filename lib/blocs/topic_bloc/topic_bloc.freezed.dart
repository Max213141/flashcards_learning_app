// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicEvent()';
}


}

/// @nodoc
class $TopicEventCopyWith<$Res>  {
$TopicEventCopyWith(TopicEvent _, $Res Function(TopicEvent) __);
}


/// Adds pattern-matching-related methods to [TopicEvent].
extension TopicEventPatterns on TopicEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SortChanged value)?  sortChanged,TResult Function( _RefreshRequested value)?  refreshRequested,TResult Function( _TopicsUpdated value)?  topicsUpdated,TResult Function( _SubscriptionFailed value)?  subscriptionFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SortChanged() when sortChanged != null:
return sortChanged(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _TopicsUpdated() when topicsUpdated != null:
return topicsUpdated(_that);case _SubscriptionFailed() when subscriptionFailed != null:
return subscriptionFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SortChanged value)  sortChanged,required TResult Function( _RefreshRequested value)  refreshRequested,required TResult Function( _TopicsUpdated value)  topicsUpdated,required TResult Function( _SubscriptionFailed value)  subscriptionFailed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SortChanged():
return sortChanged(_that);case _RefreshRequested():
return refreshRequested(_that);case _TopicsUpdated():
return topicsUpdated(_that);case _SubscriptionFailed():
return subscriptionFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SortChanged value)?  sortChanged,TResult? Function( _RefreshRequested value)?  refreshRequested,TResult? Function( _TopicsUpdated value)?  topicsUpdated,TResult? Function( _SubscriptionFailed value)?  subscriptionFailed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SortChanged() when sortChanged != null:
return sortChanged(_that);case _RefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _TopicsUpdated() when topicsUpdated != null:
return topicsUpdated(_that);case _SubscriptionFailed() when subscriptionFailed != null:
return subscriptionFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( TopicSortOption sortOption)?  sortChanged,TResult Function()?  refreshRequested,TResult Function( TopicSortOption selectedSort,  List<TopicSummary> topics)?  topicsUpdated,TResult Function( TopicSortOption selectedSort,  String message)?  subscriptionFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SortChanged() when sortChanged != null:
return sortChanged(_that.sortOption);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _TopicsUpdated() when topicsUpdated != null:
return topicsUpdated(_that.selectedSort,_that.topics);case _SubscriptionFailed() when subscriptionFailed != null:
return subscriptionFailed(_that.selectedSort,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( TopicSortOption sortOption)  sortChanged,required TResult Function()  refreshRequested,required TResult Function( TopicSortOption selectedSort,  List<TopicSummary> topics)  topicsUpdated,required TResult Function( TopicSortOption selectedSort,  String message)  subscriptionFailed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SortChanged():
return sortChanged(_that.sortOption);case _RefreshRequested():
return refreshRequested();case _TopicsUpdated():
return topicsUpdated(_that.selectedSort,_that.topics);case _SubscriptionFailed():
return subscriptionFailed(_that.selectedSort,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( TopicSortOption sortOption)?  sortChanged,TResult? Function()?  refreshRequested,TResult? Function( TopicSortOption selectedSort,  List<TopicSummary> topics)?  topicsUpdated,TResult? Function( TopicSortOption selectedSort,  String message)?  subscriptionFailed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SortChanged() when sortChanged != null:
return sortChanged(_that.sortOption);case _RefreshRequested() when refreshRequested != null:
return refreshRequested();case _TopicsUpdated() when topicsUpdated != null:
return topicsUpdated(_that.selectedSort,_that.topics);case _SubscriptionFailed() when subscriptionFailed != null:
return subscriptionFailed(_that.selectedSort,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TopicEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicEvent.started()';
}


}




/// @nodoc


class _SortChanged implements TopicEvent {
  const _SortChanged({required this.sortOption});
  

 final  TopicSortOption sortOption;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortChangedCopyWith<_SortChanged> get copyWith => __$SortChangedCopyWithImpl<_SortChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortChanged&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption));
}


@override
int get hashCode => Object.hash(runtimeType,sortOption);

@override
String toString() {
  return 'TopicEvent.sortChanged(sortOption: $sortOption)';
}


}

/// @nodoc
abstract mixin class _$SortChangedCopyWith<$Res> implements $TopicEventCopyWith<$Res> {
  factory _$SortChangedCopyWith(_SortChanged value, $Res Function(_SortChanged) _then) = __$SortChangedCopyWithImpl;
@useResult
$Res call({
 TopicSortOption sortOption
});




}
/// @nodoc
class __$SortChangedCopyWithImpl<$Res>
    implements _$SortChangedCopyWith<$Res> {
  __$SortChangedCopyWithImpl(this._self, this._then);

  final _SortChanged _self;
  final $Res Function(_SortChanged) _then;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortOption = null,}) {
  return _then(_SortChanged(
sortOption: null == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as TopicSortOption,
  ));
}


}

/// @nodoc


class _RefreshRequested implements TopicEvent {
  const _RefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TopicEvent.refreshRequested()';
}


}




/// @nodoc


class _TopicsUpdated implements TopicEvent {
  const _TopicsUpdated({required this.selectedSort, required final  List<TopicSummary> topics}): _topics = topics;
  

 final  TopicSortOption selectedSort;
 final  List<TopicSummary> _topics;
 List<TopicSummary> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}


/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicsUpdatedCopyWith<_TopicsUpdated> get copyWith => __$TopicsUpdatedCopyWithImpl<_TopicsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicsUpdated&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&const DeepCollectionEquality().equals(other._topics, _topics));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort,const DeepCollectionEquality().hash(_topics));

@override
String toString() {
  return 'TopicEvent.topicsUpdated(selectedSort: $selectedSort, topics: $topics)';
}


}

/// @nodoc
abstract mixin class _$TopicsUpdatedCopyWith<$Res> implements $TopicEventCopyWith<$Res> {
  factory _$TopicsUpdatedCopyWith(_TopicsUpdated value, $Res Function(_TopicsUpdated) _then) = __$TopicsUpdatedCopyWithImpl;
@useResult
$Res call({
 TopicSortOption selectedSort, List<TopicSummary> topics
});




}
/// @nodoc
class __$TopicsUpdatedCopyWithImpl<$Res>
    implements _$TopicsUpdatedCopyWith<$Res> {
  __$TopicsUpdatedCopyWithImpl(this._self, this._then);

  final _TopicsUpdated _self;
  final $Res Function(_TopicsUpdated) _then;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,Object? topics = null,}) {
  return _then(_TopicsUpdated(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicSummary>,
  ));
}


}

/// @nodoc


class _SubscriptionFailed implements TopicEvent {
  const _SubscriptionFailed({required this.selectedSort, required this.message});
  

 final  TopicSortOption selectedSort;
 final  String message;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionFailedCopyWith<_SubscriptionFailed> get copyWith => __$SubscriptionFailedCopyWithImpl<_SubscriptionFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionFailed&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort,message);

@override
String toString() {
  return 'TopicEvent.subscriptionFailed(selectedSort: $selectedSort, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionFailedCopyWith<$Res> implements $TopicEventCopyWith<$Res> {
  factory _$SubscriptionFailedCopyWith(_SubscriptionFailed value, $Res Function(_SubscriptionFailed) _then) = __$SubscriptionFailedCopyWithImpl;
@useResult
$Res call({
 TopicSortOption selectedSort, String message
});




}
/// @nodoc
class __$SubscriptionFailedCopyWithImpl<$Res>
    implements _$SubscriptionFailedCopyWith<$Res> {
  __$SubscriptionFailedCopyWithImpl(this._self, this._then);

  final _SubscriptionFailed _self;
  final $Res Function(_SubscriptionFailed) _then;

/// Create a copy of TopicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,Object? message = null,}) {
  return _then(_SubscriptionFailed(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TopicState {

 TopicSortOption get selectedSort;
/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicStateCopyWith<TopicState> get copyWith => _$TopicStateCopyWithImpl<TopicState>(this as TopicState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicState&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort);

@override
String toString() {
  return 'TopicState(selectedSort: $selectedSort)';
}


}

/// @nodoc
abstract mixin class $TopicStateCopyWith<$Res>  {
  factory $TopicStateCopyWith(TopicState value, $Res Function(TopicState) _then) = _$TopicStateCopyWithImpl;
@useResult
$Res call({
 TopicSortOption selectedSort
});




}
/// @nodoc
class _$TopicStateCopyWithImpl<$Res>
    implements $TopicStateCopyWith<$Res> {
  _$TopicStateCopyWithImpl(this._self, this._then);

  final TopicState _self;
  final $Res Function(TopicState) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedSort = null,}) {
  return _then(_self.copyWith(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicState].
extension TopicStatePatterns on TopicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TopicSortOption selectedSort)?  initial,TResult Function( TopicSortOption selectedSort,  List<TopicSummary> previousTopics)?  loading,TResult Function( TopicSortOption selectedSort,  List<TopicSummary> topics)?  loaded,TResult Function( TopicSortOption selectedSort,  String message,  List<TopicSummary> previousTopics)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.selectedSort);case _Loading() when loading != null:
return loading(_that.selectedSort,_that.previousTopics);case _Loaded() when loaded != null:
return loaded(_that.selectedSort,_that.topics);case _Error() when error != null:
return error(_that.selectedSort,_that.message,_that.previousTopics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TopicSortOption selectedSort)  initial,required TResult Function( TopicSortOption selectedSort,  List<TopicSummary> previousTopics)  loading,required TResult Function( TopicSortOption selectedSort,  List<TopicSummary> topics)  loaded,required TResult Function( TopicSortOption selectedSort,  String message,  List<TopicSummary> previousTopics)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.selectedSort);case _Loading():
return loading(_that.selectedSort,_that.previousTopics);case _Loaded():
return loaded(_that.selectedSort,_that.topics);case _Error():
return error(_that.selectedSort,_that.message,_that.previousTopics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TopicSortOption selectedSort)?  initial,TResult? Function( TopicSortOption selectedSort,  List<TopicSummary> previousTopics)?  loading,TResult? Function( TopicSortOption selectedSort,  List<TopicSummary> topics)?  loaded,TResult? Function( TopicSortOption selectedSort,  String message,  List<TopicSummary> previousTopics)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.selectedSort);case _Loading() when loading != null:
return loading(_that.selectedSort,_that.previousTopics);case _Loaded() when loaded != null:
return loaded(_that.selectedSort,_that.topics);case _Error() when error != null:
return error(_that.selectedSort,_that.message,_that.previousTopics);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TopicState {
  const _Initial({this.selectedSort = TopicSortOption.createdDesc});
  

@override@JsonKey() final  TopicSortOption selectedSort;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort);

@override
String toString() {
  return 'TopicState.initial(selectedSort: $selectedSort)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 TopicSortOption selectedSort
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,}) {
  return _then(_Initial(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,
  ));
}


}

/// @nodoc


class _Loading implements TopicState {
  const _Loading({required this.selectedSort, final  List<TopicSummary> previousTopics = const <TopicSummary>[]}): _previousTopics = previousTopics;
  

@override final  TopicSortOption selectedSort;
 final  List<TopicSummary> _previousTopics;
@JsonKey() List<TopicSummary> get previousTopics {
  if (_previousTopics is EqualUnmodifiableListView) return _previousTopics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previousTopics);
}


/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&const DeepCollectionEquality().equals(other._previousTopics, _previousTopics));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort,const DeepCollectionEquality().hash(_previousTopics));

@override
String toString() {
  return 'TopicState.loading(selectedSort: $selectedSort, previousTopics: $previousTopics)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 TopicSortOption selectedSort, List<TopicSummary> previousTopics
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,Object? previousTopics = null,}) {
  return _then(_Loading(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,previousTopics: null == previousTopics ? _self._previousTopics : previousTopics // ignore: cast_nullable_to_non_nullable
as List<TopicSummary>,
  ));
}


}

/// @nodoc


class _Loaded implements TopicState {
  const _Loaded({required this.selectedSort, required final  List<TopicSummary> topics}): _topics = topics;
  

@override final  TopicSortOption selectedSort;
 final  List<TopicSummary> _topics;
 List<TopicSummary> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}


/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&const DeepCollectionEquality().equals(other._topics, _topics));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort,const DeepCollectionEquality().hash(_topics));

@override
String toString() {
  return 'TopicState.loaded(selectedSort: $selectedSort, topics: $topics)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 TopicSortOption selectedSort, List<TopicSummary> topics
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,Object? topics = null,}) {
  return _then(_Loaded(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicSummary>,
  ));
}


}

/// @nodoc


class _Error implements TopicState {
  const _Error({required this.selectedSort, required this.message, final  List<TopicSummary> previousTopics = const <TopicSummary>[]}): _previousTopics = previousTopics;
  

@override final  TopicSortOption selectedSort;
 final  String message;
 final  List<TopicSummary> _previousTopics;
@JsonKey() List<TopicSummary> get previousTopics {
  if (_previousTopics is EqualUnmodifiableListView) return _previousTopics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previousTopics);
}


/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._previousTopics, _previousTopics));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSort,message,const DeepCollectionEquality().hash(_previousTopics));

@override
String toString() {
  return 'TopicState.error(selectedSort: $selectedSort, message: $message, previousTopics: $previousTopics)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TopicStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 TopicSortOption selectedSort, String message, List<TopicSummary> previousTopics
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TopicState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedSort = null,Object? message = null,Object? previousTopics = null,}) {
  return _then(_Error(
selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as TopicSortOption,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,previousTopics: null == previousTopics ? _self._previousTopics : previousTopics // ignore: cast_nullable_to_non_nullable
as List<TopicSummary>,
  ));
}


}

// dart format on
