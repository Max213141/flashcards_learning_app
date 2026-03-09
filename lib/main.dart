import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flashcards_learning_app/firebase_options.dart';
import 'package:flashcards_learning_app/my_app.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/utils/crashlytics_consent_manager.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await CrashlyticsConsentManager.initialize();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        if (CrashlyticsConsentManager.canReport) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(details);
        }
      };

      await setupServiceLocator();
      final appRouter = AppRouter();
      runApp(MyApp(appRouter: appRouter));
    },
    (error, stackTrace) {
      unawaited(_recordUncaughtError(error, stackTrace));
    },
  );
}

Future<void> _recordUncaughtError(Object error, StackTrace stackTrace) async {
  if (!CrashlyticsConsentManager.canReport) {
    return;
  }

  try {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      fatal: true,
    );
  } catch (_) {
    // Swallow to avoid recursive crash reporting failures.
  }
}
