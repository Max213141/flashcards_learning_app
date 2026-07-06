part of 'locale_bloc.dart';

@freezed
sealed class LocaleState with _$LocaleState {
  const factory LocaleState({required Locale locale}) = _LocaleState;
}
