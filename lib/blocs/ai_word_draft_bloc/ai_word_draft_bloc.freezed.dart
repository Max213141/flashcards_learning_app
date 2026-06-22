// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_word_draft_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiWordDraftEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiWordDraftEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiWordDraftEvent()';
}


}

/// @nodoc
class $AiWordDraftEventCopyWith<$Res>  {
$AiWordDraftEventCopyWith(AiWordDraftEvent _, $Res Function(AiWordDraftEvent) __);
}


/// Adds pattern-matching-related methods to [AiWordDraftEvent].
extension AiWordDraftEventPatterns on AiWordDraftEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GenerateRequested value)?  generateRequested,TResult Function( _DownloadAccepted value)?  downloadAccepted,TResult Function( _DownloadCancelled value)?  downloadCancelled,TResult Function( _StatusConsumed value)?  statusConsumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GenerateRequested() when generateRequested != null:
return generateRequested(_that);case _DownloadAccepted() when downloadAccepted != null:
return downloadAccepted(_that);case _DownloadCancelled() when downloadCancelled != null:
return downloadCancelled(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GenerateRequested value)  generateRequested,required TResult Function( _DownloadAccepted value)  downloadAccepted,required TResult Function( _DownloadCancelled value)  downloadCancelled,required TResult Function( _StatusConsumed value)  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GenerateRequested():
return generateRequested(_that);case _DownloadAccepted():
return downloadAccepted(_that);case _DownloadCancelled():
return downloadCancelled(_that);case _StatusConsumed():
return statusConsumed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GenerateRequested value)?  generateRequested,TResult? Function( _DownloadAccepted value)?  downloadAccepted,TResult? Function( _DownloadCancelled value)?  downloadCancelled,TResult? Function( _StatusConsumed value)?  statusConsumed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GenerateRequested() when generateRequested != null:
return generateRequested(_that);case _DownloadAccepted() when downloadAccepted != null:
return downloadAccepted(_that);case _DownloadCancelled() when downloadCancelled != null:
return downloadCancelled(_that);case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String input,  String sourceLanguage,  String targetLanguage)?  generateRequested,TResult Function()?  downloadAccepted,TResult Function()?  downloadCancelled,TResult Function()?  statusConsumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GenerateRequested() when generateRequested != null:
return generateRequested(_that.input,_that.sourceLanguage,_that.targetLanguage);case _DownloadAccepted() when downloadAccepted != null:
return downloadAccepted();case _DownloadCancelled() when downloadCancelled != null:
return downloadCancelled();case _StatusConsumed() when statusConsumed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String input,  String sourceLanguage,  String targetLanguage)  generateRequested,required TResult Function()  downloadAccepted,required TResult Function()  downloadCancelled,required TResult Function()  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GenerateRequested():
return generateRequested(_that.input,_that.sourceLanguage,_that.targetLanguage);case _DownloadAccepted():
return downloadAccepted();case _DownloadCancelled():
return downloadCancelled();case _StatusConsumed():
return statusConsumed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String input,  String sourceLanguage,  String targetLanguage)?  generateRequested,TResult? Function()?  downloadAccepted,TResult? Function()?  downloadCancelled,TResult? Function()?  statusConsumed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GenerateRequested() when generateRequested != null:
return generateRequested(_that.input,_that.sourceLanguage,_that.targetLanguage);case _DownloadAccepted() when downloadAccepted != null:
return downloadAccepted();case _DownloadCancelled() when downloadCancelled != null:
return downloadCancelled();case _StatusConsumed() when statusConsumed != null:
return statusConsumed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AiWordDraftEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiWordDraftEvent.started()';
}


}




/// @nodoc


class _GenerateRequested implements AiWordDraftEvent {
  const _GenerateRequested({required this.input, required this.sourceLanguage, required this.targetLanguage});
  

 final  String input;
 final  String sourceLanguage;
 final  String targetLanguage;

/// Create a copy of AiWordDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateRequestedCopyWith<_GenerateRequested> get copyWith => __$GenerateRequestedCopyWithImpl<_GenerateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateRequested&&(identical(other.input, input) || other.input == input)&&(identical(other.sourceLanguage, sourceLanguage) || other.sourceLanguage == sourceLanguage)&&(identical(other.targetLanguage, targetLanguage) || other.targetLanguage == targetLanguage));
}


@override
int get hashCode => Object.hash(runtimeType,input,sourceLanguage,targetLanguage);

@override
String toString() {
  return 'AiWordDraftEvent.generateRequested(input: $input, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage)';
}


}

/// @nodoc
abstract mixin class _$GenerateRequestedCopyWith<$Res> implements $AiWordDraftEventCopyWith<$Res> {
  factory _$GenerateRequestedCopyWith(_GenerateRequested value, $Res Function(_GenerateRequested) _then) = __$GenerateRequestedCopyWithImpl;
@useResult
$Res call({
 String input, String sourceLanguage, String targetLanguage
});




}
/// @nodoc
class __$GenerateRequestedCopyWithImpl<$Res>
    implements _$GenerateRequestedCopyWith<$Res> {
  __$GenerateRequestedCopyWithImpl(this._self, this._then);

  final _GenerateRequested _self;
  final $Res Function(_GenerateRequested) _then;

/// Create a copy of AiWordDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? input = null,Object? sourceLanguage = null,Object? targetLanguage = null,}) {
  return _then(_GenerateRequested(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as String,sourceLanguage: null == sourceLanguage ? _self.sourceLanguage : sourceLanguage // ignore: cast_nullable_to_non_nullable
as String,targetLanguage: null == targetLanguage ? _self.targetLanguage : targetLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DownloadAccepted implements AiWordDraftEvent {
  const _DownloadAccepted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadAccepted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiWordDraftEvent.downloadAccepted()';
}


}




/// @nodoc


class _DownloadCancelled implements AiWordDraftEvent {
  const _DownloadCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiWordDraftEvent.downloadCancelled()';
}


}




/// @nodoc


class _StatusConsumed implements AiWordDraftEvent {
  const _StatusConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiWordDraftEvent.statusConsumed()';
}


}




/// @nodoc
mixin _$AiWordDraftState {

 AiSetupStatus get setupStatus; AiGenerationStatus get generationStatus; int get downloadProgress; AiWordDraft? get draft; String? get message; String? get pendingInput; String? get pendingSourceLanguage; String? get pendingTargetLanguage;
/// Create a copy of AiWordDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiWordDraftStateCopyWith<AiWordDraftState> get copyWith => _$AiWordDraftStateCopyWithImpl<AiWordDraftState>(this as AiWordDraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiWordDraftState&&(identical(other.setupStatus, setupStatus) || other.setupStatus == setupStatus)&&(identical(other.generationStatus, generationStatus) || other.generationStatus == generationStatus)&&(identical(other.downloadProgress, downloadProgress) || other.downloadProgress == downloadProgress)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.message, message) || other.message == message)&&(identical(other.pendingInput, pendingInput) || other.pendingInput == pendingInput)&&(identical(other.pendingSourceLanguage, pendingSourceLanguage) || other.pendingSourceLanguage == pendingSourceLanguage)&&(identical(other.pendingTargetLanguage, pendingTargetLanguage) || other.pendingTargetLanguage == pendingTargetLanguage));
}


@override
int get hashCode => Object.hash(runtimeType,setupStatus,generationStatus,downloadProgress,draft,message,pendingInput,pendingSourceLanguage,pendingTargetLanguage);

@override
String toString() {
  return 'AiWordDraftState(setupStatus: $setupStatus, generationStatus: $generationStatus, downloadProgress: $downloadProgress, draft: $draft, message: $message, pendingInput: $pendingInput, pendingSourceLanguage: $pendingSourceLanguage, pendingTargetLanguage: $pendingTargetLanguage)';
}


}

/// @nodoc
abstract mixin class $AiWordDraftStateCopyWith<$Res>  {
  factory $AiWordDraftStateCopyWith(AiWordDraftState value, $Res Function(AiWordDraftState) _then) = _$AiWordDraftStateCopyWithImpl;
@useResult
$Res call({
 AiSetupStatus setupStatus, AiGenerationStatus generationStatus, int downloadProgress, AiWordDraft? draft, String? message, String? pendingInput, String? pendingSourceLanguage, String? pendingTargetLanguage
});




}
/// @nodoc
class _$AiWordDraftStateCopyWithImpl<$Res>
    implements $AiWordDraftStateCopyWith<$Res> {
  _$AiWordDraftStateCopyWithImpl(this._self, this._then);

  final AiWordDraftState _self;
  final $Res Function(AiWordDraftState) _then;

/// Create a copy of AiWordDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? setupStatus = null,Object? generationStatus = null,Object? downloadProgress = null,Object? draft = freezed,Object? message = freezed,Object? pendingInput = freezed,Object? pendingSourceLanguage = freezed,Object? pendingTargetLanguage = freezed,}) {
  return _then(_self.copyWith(
setupStatus: null == setupStatus ? _self.setupStatus : setupStatus // ignore: cast_nullable_to_non_nullable
as AiSetupStatus,generationStatus: null == generationStatus ? _self.generationStatus : generationStatus // ignore: cast_nullable_to_non_nullable
as AiGenerationStatus,downloadProgress: null == downloadProgress ? _self.downloadProgress : downloadProgress // ignore: cast_nullable_to_non_nullable
as int,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as AiWordDraft?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pendingInput: freezed == pendingInput ? _self.pendingInput : pendingInput // ignore: cast_nullable_to_non_nullable
as String?,pendingSourceLanguage: freezed == pendingSourceLanguage ? _self.pendingSourceLanguage : pendingSourceLanguage // ignore: cast_nullable_to_non_nullable
as String?,pendingTargetLanguage: freezed == pendingTargetLanguage ? _self.pendingTargetLanguage : pendingTargetLanguage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AiWordDraftState].
extension AiWordDraftStatePatterns on AiWordDraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiWordDraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiWordDraftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiWordDraftState value)  $default,){
final _that = this;
switch (_that) {
case _AiWordDraftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiWordDraftState value)?  $default,){
final _that = this;
switch (_that) {
case _AiWordDraftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AiSetupStatus setupStatus,  AiGenerationStatus generationStatus,  int downloadProgress,  AiWordDraft? draft,  String? message,  String? pendingInput,  String? pendingSourceLanguage,  String? pendingTargetLanguage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiWordDraftState() when $default != null:
return $default(_that.setupStatus,_that.generationStatus,_that.downloadProgress,_that.draft,_that.message,_that.pendingInput,_that.pendingSourceLanguage,_that.pendingTargetLanguage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AiSetupStatus setupStatus,  AiGenerationStatus generationStatus,  int downloadProgress,  AiWordDraft? draft,  String? message,  String? pendingInput,  String? pendingSourceLanguage,  String? pendingTargetLanguage)  $default,) {final _that = this;
switch (_that) {
case _AiWordDraftState():
return $default(_that.setupStatus,_that.generationStatus,_that.downloadProgress,_that.draft,_that.message,_that.pendingInput,_that.pendingSourceLanguage,_that.pendingTargetLanguage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AiSetupStatus setupStatus,  AiGenerationStatus generationStatus,  int downloadProgress,  AiWordDraft? draft,  String? message,  String? pendingInput,  String? pendingSourceLanguage,  String? pendingTargetLanguage)?  $default,) {final _that = this;
switch (_that) {
case _AiWordDraftState() when $default != null:
return $default(_that.setupStatus,_that.generationStatus,_that.downloadProgress,_that.draft,_that.message,_that.pendingInput,_that.pendingSourceLanguage,_that.pendingTargetLanguage);case _:
  return null;

}
}

}

/// @nodoc


class _AiWordDraftState implements AiWordDraftState {
  const _AiWordDraftState({this.setupStatus = AiSetupStatus.initial, this.generationStatus = AiGenerationStatus.idle, this.downloadProgress = 0, this.draft, this.message, this.pendingInput, this.pendingSourceLanguage, this.pendingTargetLanguage});
  

@override@JsonKey() final  AiSetupStatus setupStatus;
@override@JsonKey() final  AiGenerationStatus generationStatus;
@override@JsonKey() final  int downloadProgress;
@override final  AiWordDraft? draft;
@override final  String? message;
@override final  String? pendingInput;
@override final  String? pendingSourceLanguage;
@override final  String? pendingTargetLanguage;

/// Create a copy of AiWordDraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiWordDraftStateCopyWith<_AiWordDraftState> get copyWith => __$AiWordDraftStateCopyWithImpl<_AiWordDraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiWordDraftState&&(identical(other.setupStatus, setupStatus) || other.setupStatus == setupStatus)&&(identical(other.generationStatus, generationStatus) || other.generationStatus == generationStatus)&&(identical(other.downloadProgress, downloadProgress) || other.downloadProgress == downloadProgress)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.message, message) || other.message == message)&&(identical(other.pendingInput, pendingInput) || other.pendingInput == pendingInput)&&(identical(other.pendingSourceLanguage, pendingSourceLanguage) || other.pendingSourceLanguage == pendingSourceLanguage)&&(identical(other.pendingTargetLanguage, pendingTargetLanguage) || other.pendingTargetLanguage == pendingTargetLanguage));
}


@override
int get hashCode => Object.hash(runtimeType,setupStatus,generationStatus,downloadProgress,draft,message,pendingInput,pendingSourceLanguage,pendingTargetLanguage);

@override
String toString() {
  return 'AiWordDraftState(setupStatus: $setupStatus, generationStatus: $generationStatus, downloadProgress: $downloadProgress, draft: $draft, message: $message, pendingInput: $pendingInput, pendingSourceLanguage: $pendingSourceLanguage, pendingTargetLanguage: $pendingTargetLanguage)';
}


}

/// @nodoc
abstract mixin class _$AiWordDraftStateCopyWith<$Res> implements $AiWordDraftStateCopyWith<$Res> {
  factory _$AiWordDraftStateCopyWith(_AiWordDraftState value, $Res Function(_AiWordDraftState) _then) = __$AiWordDraftStateCopyWithImpl;
@override @useResult
$Res call({
 AiSetupStatus setupStatus, AiGenerationStatus generationStatus, int downloadProgress, AiWordDraft? draft, String? message, String? pendingInput, String? pendingSourceLanguage, String? pendingTargetLanguage
});




}
/// @nodoc
class __$AiWordDraftStateCopyWithImpl<$Res>
    implements _$AiWordDraftStateCopyWith<$Res> {
  __$AiWordDraftStateCopyWithImpl(this._self, this._then);

  final _AiWordDraftState _self;
  final $Res Function(_AiWordDraftState) _then;

/// Create a copy of AiWordDraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? setupStatus = null,Object? generationStatus = null,Object? downloadProgress = null,Object? draft = freezed,Object? message = freezed,Object? pendingInput = freezed,Object? pendingSourceLanguage = freezed,Object? pendingTargetLanguage = freezed,}) {
  return _then(_AiWordDraftState(
setupStatus: null == setupStatus ? _self.setupStatus : setupStatus // ignore: cast_nullable_to_non_nullable
as AiSetupStatus,generationStatus: null == generationStatus ? _self.generationStatus : generationStatus // ignore: cast_nullable_to_non_nullable
as AiGenerationStatus,downloadProgress: null == downloadProgress ? _self.downloadProgress : downloadProgress // ignore: cast_nullable_to_non_nullable
as int,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as AiWordDraft?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pendingInput: freezed == pendingInput ? _self.pendingInput : pendingInput // ignore: cast_nullable_to_non_nullable
as String?,pendingSourceLanguage: freezed == pendingSourceLanguage ? _self.pendingSourceLanguage : pendingSourceLanguage // ignore: cast_nullable_to_non_nullable
as String?,pendingTargetLanguage: freezed == pendingTargetLanguage ? _self.pendingTargetLanguage : pendingTargetLanguage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
