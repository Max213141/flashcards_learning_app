import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/screens/screens.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: EditWordRoute.page),
    AutoRoute(page: TestRoute.page),
    AutoRoute(page: TopicRoute.page),
  ];
}
