import 'package:shared_preferences/shared_preferences.dart';

/// Stores app-wide local preferences.
class AppPreferencesStore {
  AppPreferencesStore(this._prefs);

  static const _isFirstLaunchKey = 'app_preferences.is_first_launch';

  final SharedPreferences _prefs;

  static Future<AppPreferencesStore> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AppPreferencesStore(prefs);
  }

  bool get isFirstLaunch => _prefs.getBool(_isFirstLaunchKey) ?? true;

  Future<void> setFirstLaunchComplete() {
    return _prefs.setBool(_isFirstLaunchKey, false);
  }
}
