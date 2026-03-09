import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrashlyticsConsentManager {
  static const String _consentKey = 'crashlytics_collection_consent';
  static bool _isInitialized = false;
  static bool _isCollectionEnabled = false;

  static bool get canReport => _isInitialized && _isCollectionEnabled;

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final storedConsent = prefs.getBool(_consentKey);

    _isInitialized = true;
    _isCollectionEnabled = storedConsent ?? false;

    if (storedConsent != null) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        storedConsent,
      );
    }
  }

  static Future<bool?> getStoredConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentKey);
  }

  static Future<void> setConsent(bool hasConsent) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentKey, hasConsent);
    _isInitialized = true;
    _isCollectionEnabled = hasConsent;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      hasConsent,
    );
  }
}
