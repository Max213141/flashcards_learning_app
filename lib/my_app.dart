import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Locale locale;
  const MyApp({
    super.key,
    required this.appRouter,
    this.locale = const Locale('en'),
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      locale: locale,
      onGenerateTitle: (context) => l10nOf(context).appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppConst.black),
          bodyMedium: TextStyle(color: AppConst.black),
          bodyLarge: TextStyle(color: AppConst.black),
        ),
        scaffoldBackgroundColor: AppConst.background,
        appBarTheme: AppBarTheme(backgroundColor: AppConst.background),
      ),

      // WordDefinitionScreen(
      //   word: 'lkgr',
      //   word: 'lkgrw',
      //   topic: 'nkgrkgrkl',
      // ),
    );
  }
}
