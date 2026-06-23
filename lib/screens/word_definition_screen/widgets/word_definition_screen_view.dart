import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/word_definition_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordDefinitionScreenView extends StatelessWidget {
  const WordDefinitionScreenView({
    super.key,
    required this.initialWord,
    required this.topicName,
    required this.topicColor,
  });

  final Word initialWord;
  final String topicName;
  final Color topicColor;

  Future<void> _editWord(BuildContext context, Word word) async {
    final result = await context.router.push<bool>(EditWordRoute(word: word));
    if (!context.mounted) return;
    if (result != true) return;
    final id = word.id;
    if (id == null) return;
    context.read<WordBloc>().add(WordEvent.refreshRequested(wordId: id));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WordEditingBloc, WordEditingState>(
          listener: (context, state) {
            if (state.status == WordEditingStatus.wordUpdated) {
              final wordId = state.word?.id;
              if (wordId != null) {
                context.read<WordBloc>().add(
                  WordEvent.refreshRequested(wordId: wordId),
                );
              }
              context.read<WordEditingBloc>().add(
                const WordEditingEvent.statusConsumed(),
              );
              return;
            }

            if (state.status == WordEditingStatus.failure &&
                state.message != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
              context.read<WordEditingBloc>().add(
                const WordEditingEvent.statusConsumed(),
              );
            }
          },
        ),
        BlocListener<WordBloc, WordState>(
          listener: (context, state) {
            if (state.status == WordStatus.wordDeleted) {
              Navigator.of(context).pop(true);
              return;
            }

            if (state.status == WordStatus.failure && state.message != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message!)));
              context.read<WordBloc>().add(const WordEvent.statusConsumed());
            }
          },
        ),
      ],
      child: BlocBuilder<WordBloc, WordState>(
        builder: (context, state) {
          final currentWord = state.word ?? initialWord;
          final hasChanges = state.hasChanges;

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              Navigator.of(context).pop(hasChanges);
            },
            child: Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(hasChanges),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(10),
                    child: SvgPicture.asset(
                      'assets/iconss/arrow_back.svg',
                      colorFilter: const ColorFilter.mode(
                        AppConst.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          l10nOf(context).wordDefinitionScreenTitle,
                          style: AppConst.h3,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _editWord(context, currentWord),
                      child: SvgPicture.asset(
                        'assets/iconss/edit.svg',
                        width: 24,
                      ),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        context.read<WordBloc>().add(
                          const WordEvent.deleteRequested(),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/iconss/delete.svg',
                        width: 24,
                      ),
                    ),
                  ],
                ),
              ),
              body: WordDefinitionScreenBody(
                wordData: currentWord,
                topicColor: topicColor,
                topicName: topicName,
                toggleLearned: () {
                  context.read<WordEditingBloc>().add(
                    WordEditingEvent.toggleLearnedRequested(word: currentWord),
                  );
                },
                know: currentWord.learned,
              ),
            ),
          );
        },
      ),
    );
  }
}
