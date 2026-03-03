import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TestScreen extends StatelessWidget {
  final int topicId;
  final Color topicColor;
  const TestScreen({
    super.key,
    required this.topicId,
    required this.topicColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<TestBloc>()..add(TestEvent.started(topicId: topicId)),
      child: TestScreenView(topicId: topicId, topicColor: topicColor),
    );
  }
}
