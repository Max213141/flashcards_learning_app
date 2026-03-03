import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TopicScreen extends StatelessWidget {
  final String topicName;
  final int topicId;
  final Color topicColor;
  const TopicScreen({
    super.key,
    required this.topicName,
    required this.topicId,
    required this.topicColor,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<TopicDetailBloc>()
            ..add(
              TopicDetailEvent.started(topicId: topicId, topicName: topicName),
            ),
        ),
        BlocProvider(create: (_) => getIt<WordBloc>()),
      ],
      child: TopicScreenView(
        topicName: topicName,
        topicId: topicId,
        topicColor: topicColor,
      ),
    );
  }
}
