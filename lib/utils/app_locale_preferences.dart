import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalePreferences {
  static const String _localeCodeKey = 'app_locale_code';
  static const Locale defaultLocale = Locale('en');
  static const Set<String> supportedLanguageCodes = {'en', 'ru'};

  static Future<Locale> getCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeCodeKey);

    if (languageCode == null ||
        !supportedLanguageCodes.contains(languageCode)) {
      return defaultLocale;
    }

    return Locale(languageCode);
  }

  static Future<void> setCurrentLocale(Locale locale) async {
    final languageCode = supportedLanguageCodes.contains(locale.languageCode)
        ? locale.languageCode
        : defaultLocale.languageCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeCodeKey, languageCode);
  }
}
