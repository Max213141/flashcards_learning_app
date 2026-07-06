import 'package:flashcards_learning_app/utils/app_locale_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_event.dart';
part 'locale_state.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc({Locale initialLocale = AppLocalePreferences.defaultLocale})
    : super(
        LocaleState(
          locale: AppLocalePreferences.supportedLocaleOrDefault(initialLocale),
        ),
      ) {
    on<_Started>(_onStarted);
    on<_LocaleChanged>(_onLocaleChanged);
  }

  Future<void> _onStarted(_Started event, Emitter<LocaleState> emit) async {
    final locale = await AppLocalePreferences.getCurrentLocale();
    if (locale == state.locale) return;

    emit(state.copyWith(locale: locale));
  }

  Future<void> _onLocaleChanged(
    _LocaleChanged event,
    Emitter<LocaleState> emit,
  ) async {
    final locale = AppLocalePreferences.supportedLocaleOrDefault(event.locale);
    if (locale == state.locale) return;

    await AppLocalePreferences.setCurrentLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
