import 'package:flashcards_learning_app/my_app.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();

  final appRouter = AppRouter();

  runApp(MyApp(appRouter: appRouter));
}
