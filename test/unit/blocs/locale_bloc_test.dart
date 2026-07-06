import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:flashcards_learning_app/utils/app_locale_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  blocTest<LocaleBloc, LocaleState>(
    'started loads stored locale',
    setUp: () async {
      await AppLocalePreferences.setCurrentLocale(const Locale('ru'));
    },
    build: LocaleBloc.new,
    act: (bloc) => bloc.add(const LocaleEvent.started()),
    expect: () => const [LocaleState(locale: Locale('ru'))],
  );

  blocTest<LocaleBloc, LocaleState>(
    'localeChanged saves and emits selected locale',
    build: LocaleBloc.new,
    act: (bloc) =>
        bloc.add(const LocaleEvent.localeChanged(locale: Locale('ru'))),
    expect: () => const [LocaleState(locale: Locale('ru'))],
    verify: (_) async {
      final locale = await AppLocalePreferences.getCurrentLocale();
      expect(locale, const Locale('ru'));
    },
  );

  blocTest<LocaleBloc, LocaleState>(
    'localeChanged emits nothing when locale is unchanged',
    build: () => LocaleBloc(initialLocale: const Locale('ru')),
    act: (bloc) =>
        bloc.add(const LocaleEvent.localeChanged(locale: Locale('ru'))),
    expect: () => const <LocaleState>[],
  );

  blocTest<LocaleBloc, LocaleState>(
    'localeChanged falls back to English for unsupported locale',
    build: () => LocaleBloc(initialLocale: const Locale('ru')),
    act: (bloc) =>
        bloc.add(const LocaleEvent.localeChanged(locale: Locale('de'))),
    expect: () => const [LocaleState(locale: Locale('en'))],
    verify: (_) async {
      final locale = await AppLocalePreferences.getCurrentLocale();
      expect(locale, const Locale('en'));
    },
  );
}
