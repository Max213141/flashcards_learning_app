import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/rotated_fab.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TopicScreenView extends StatefulWidget {
  const TopicScreenView({
    super.key,
    required this.topicName,
    required this.topicId,
    required this.topicColor,
  });

  final String topicName;
  final int topicId;
  final Color topicColor;

  @override
  State<TopicScreenView> createState() => _TopicScreenViewState();
}

class _TopicScreenViewState extends State<TopicScreenView> {
  bool buttonsHidden = true;

  void _onAdd() async {
    final result = await showDialog<Word>(
      context: context,
      builder: (context) => AddWordDialog(
        onSave: (Word newWord) async {
          if (!context.mounted) return;
          Navigator.of(context).pop(
            newWord.copyWith(topic: widget.topicName, topicId: widget.topicId),
          );
        },
      ),
    );
    if (!mounted || result == null) return;
    setState(() {
      buttonsHidden = !buttonsHidden;
    });
    context.read<TopicDetailBloc>().add(
      TopicDetailEvent.addWordRequested(newWord: result),
    );
  }

  Future<void> _deleteWord(int wordId) async {
    if (wordId < 0) return;
    context.read<WordBloc>().add(WordEvent.deleteRequested(wordId: wordId));
  }

  void _reoloadDB() {
    context.read<TopicDetailBloc>().add(
      const TopicDetailEvent.reloadRequested(),
    );
  }

  void _onAddJSON() {
    context.read<TopicDetailBloc>().add(
      const TopicDetailEvent.importWordsRequested(),
    );
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onEdit(Word wordInfo) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider(
        create: (_) =>
            getIt<WordEditingBloc>()
              ..add(WordEditingEvent.started(word: wordInfo)),
        child: EditWordDialog(word: wordInfo),
      ),
    );
    if (result == true && mounted) {
      _reoloadDB();
    }
  }

  Future<void> _confirmDeleteTopic() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => PopUpBox(
        popupContent: DeletionAcceptanceBody(topicName: widget.topicName),
      ),
    );

    if (shouldDelete != true) return;
    if (!mounted) return;
    context.read<TopicDetailBloc>().add(
      const TopicDetailEvent.deleteTopicRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WordBloc, WordState>(
          listener: (context, state) {
            if (state.status == WordStatus.wordDeleted) {
              _reoloadDB();
              context.read<WordBloc>().add(const WordEvent.statusConsumed());
              return;
            }

            if (state.status == WordStatus.failure && state.message != null) {
              _showSnack(state.message!);
              context.read<WordBloc>().add(const WordEvent.statusConsumed());
            }
          },
        ),
        BlocListener<TopicDetailBloc, TopicDetailState>(
          listener: (context, state) {
            if (state.status == TopicDetailStatus.topicDeleted) {
              context.router.replaceAll([const MainRoute()]);
              return;
            }

            if (state.status == TopicDetailStatus.failure &&
                state.message != null) {
              _showSnack(state.message!);
              context.read<TopicDetailBloc>().add(
                const TopicDetailEvent.statusConsumed(),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<TopicDetailBloc, TopicDetailState>(
        builder: (context, state) {
          final words = state.words;
          final totalWords = words.length;
          final learnedWords = words.where((w) => w.learned).length;
          final progress = totalWords == 0 ? 0.0 : learnedWords / totalWords;

          if (state.isLoading && words.isEmpty) {
            return const Scaffold(body: Center(child: FlashcardsLoader()));
          }

          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context, state.hasChanges),
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
              backgroundColor: AppConst.primary,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                GestureDetector(
                  onTap: _confirmDeleteTopic,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SvgPicture.asset(
                      'assets/iconss/delete.svg',
                      height: 28,
                      width: 28,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: RotatingFab(
              onPressed: () {
                setState(() {
                  buttonsHidden = !buttonsHidden;
                });
              },
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    AppBarWidget(
                      firstPart: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.topicName, style: AppConst.h2),
                          Text(
                            formatRussianWordCount(totalWords),
                            style: AppConst.additionalText,
                          ),
                        ],
                      ),
                      secondPart: Row(
                        children: [
                          CircularProgressBar(
                            width: 50,
                            height: 50,
                            indicatorColor: AppConst.lavender,
                            progress: progress,
                            accomplishment: Text(
                              '${(progress * 100).round()}%',
                              style: AppConst.additionalText,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Общий \nпрогресс', style: AppConst.text),
                        ],
                      ),
                    ),
                    ButtonsRow(
                      isTopicEmpty: words.isEmpty,
                      topicId: widget.topicId,
                      topicColor: widget.topicColor,
                    ),
                    TopicWordsListWidget(
                      wordsList: words,
                      topicName: widget.topicName,
                      topicColor: widget.topicColor,
                      deleteWord: _deleteWord,
                      editWord: _onEdit,
                      reloadDB: _reoloadDB,
                    ),
                  ],
                ),
                Positioned(
                  right: 30,
                  bottom: MediaQuery.of(context).padding.bottom + 85,
                  child: Offstage(
                    offstage: buttonsHidden,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomActionButton(
                          buttonText: 'Добавить файл JSON',
                          icon: 'assets/iconss/file_export.svg',
                          onTap: _onAddJSON,
                        ),
                        SizedBox(height: 10),
                        CustomActionButton(
                          buttonText: 'Добавить слово',
                          icon: 'assets/iconss/plus.svg',
                          onTap: _onAdd,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
