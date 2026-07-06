import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalePreferences {
  static const String _localeCodeKey = 'app_locale_code';
  static const Locale defaultLocale = Locale('en');
  static const Set<String> supportedLanguageCodes = {'en', 'ru'};

  static Locale supportedLocaleOrDefault(Locale locale) {
    if (!supportedLanguageCodes.contains(locale.languageCode)) {
      return defaultLocale;
    }

    return Locale(locale.languageCode);
  }

  static Future<Locale> getCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeCodeKey);

    if (languageCode == null) {
      return defaultLocale;
    }

    return supportedLocaleOrDefault(Locale(languageCode));
  }

  static Future<void> setCurrentLocale(Locale locale) async {
    final languageCode = supportedLocaleOrDefault(locale).languageCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeCodeKey, languageCode);
  }
}
