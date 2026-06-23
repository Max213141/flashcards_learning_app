import 'package:flashcards_learning_app/utils/app_locale_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('returns English when no locale is stored', () async {
    final locale = await AppLocalePreferences.getCurrentLocale();

    expect(locale, const Locale('en'));
  });

  test('stores and returns supported locale', () async {
    await AppLocalePreferences.setCurrentLocale(const Locale('ru'));

    final locale = await AppLocalePreferences.getCurrentLocale();

    expect(locale, const Locale('ru'));
  });

  test('falls back to English for unsupported locale', () async {
    await AppLocalePreferences.setCurrentLocale(const Locale('de'));

    final locale = await AppLocalePreferences.getCurrentLocale();

    expect(locale, const Locale('en'));
  });
}
