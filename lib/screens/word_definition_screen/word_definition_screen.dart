import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/word_definition_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WordDefinitionScreen extends StatelessWidget {
  final Word wordData;
  final String topicName;
  final Color topicColor;

  const WordDefinitionScreen({
    super.key,
    required this.wordData,
    required this.topicName,
    required this.topicColor,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<WordBloc>()..add(WordEvent.started(word: wordData)),
        ),
        BlocProvider(
          create: (_) =>
              getIt<WordEditingBloc>()
                ..add(WordEditingEvent.started(word: wordData)),
        ),
      ],
      child: WordDefinitionScreenView(
        initialWord: wordData,
        topicName: topicName,
        topicColor: topicColor,
      ),
    );
  }
}
