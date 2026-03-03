import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/widgets/edit_word_view.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EditWordScreen extends StatelessWidget {
  final Word? word;

  const EditWordScreen({super.key, this.word});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<WordEditingBloc>()..add(WordEditingEvent.started(word: word)),
      child: EditWordScreenView(word: word),
    );
  }
}
