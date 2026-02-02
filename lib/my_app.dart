import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
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
