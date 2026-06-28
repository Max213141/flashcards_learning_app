import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/screens/exam_screen/exam_screen.dart';
import 'package:flashcards_learning_app/screens/screens.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.showOnboarding});

  final bool showOnboarding;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/intro',
      initial: showOnboarding,
    ),
    AutoRoute(
      page: MainRoute.page,
      path: '/initial_page',
      initial: !showOnboarding,
    ),
    AutoRoute(page: EditWordRoute.page),
    AutoRoute(page: TestRoute.page),
    AutoRoute(page: TopicRoute.page),
    AutoRoute(page: WordDefinitionRoute.page),
    AutoRoute(page: ExamRoute.page),
  ];
}
