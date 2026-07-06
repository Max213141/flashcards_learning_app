part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.started() = _Started;
  const factory LocaleEvent.localeChanged({required Locale locale}) =
      _LocaleChanged;
}
