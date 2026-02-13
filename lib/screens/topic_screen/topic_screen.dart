import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/pop_up_body_widget.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/rotated_fab.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/deletion_acceptance_body.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/pluralization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class TopicScreen extends StatefulWidget {
  final String topicName;
  final int topicId;
  const TopicScreen({
    super.key,
    required this.topicName,
    required this.topicId,
  });

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  bool buttonsHidden = true;
  late Future<List<Word>> _wordsFuture;

  @override
  void initState() {
    super.initState();
    _wordsFuture = appDatabase.getWordsForTopic(widget.topicId);
  }

  Future<void> _deleteWord(int wordId) async {
    if (wordId < 0) return;
    await appDatabase.deleteWordById(wordId);
    if (!mounted) return;
    setState(() {
      _wordsFuture = appDatabase.getWordsForTopic(widget.topicId);
    });
  }

  void _reoloadDB() {
    setState(() {
      _wordsFuture = appDatabase.getWordsForTopic(widget.topicId);
    });
  }

  void _onEdit(Word wordInfo) async {
    final wordId = wordInfo.id ?? -1;
    if (wordId < 0) return;
    final obtainedWord = await appDatabase.getWordById(wordId);
    if (!mounted || obtainedWord == null) return;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => EditWordDialog(
        word: obtainedWord,
        onSave: (Word updatedWord) async {
          final updated = await appDatabase.updateWord(updatedWord);
          if (!context.mounted) return;
          Navigator.of(context).pop(updated);
        },
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
    final deleted = await appDatabase.deleteTopicWithWords(widget.topicId);
    if (!mounted) return;
    if (!deleted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось удалить тему')));
      return;
    }
    context.router.replaceAll([const MainRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: FutureBuilder<List<Word>>(
        future: _wordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final words = snapshot.data ?? [];
          final totalWords = words.length;
          final learnedWords = words.where((w) => w.learned).length;
          final progress = totalWords == 0 ? 0.0 : learnedWords / totalWords;

          return Stack(
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

                  ButtonsRow(topicId: widget.topicId),

                  TopicWordsListWidget(
                    wordsList: words,
                    topicName: widget.topicName,
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
                        onTap: () {},
                      ),
                      SizedBox(height: 10),
                      CustomActionButton(
                        buttonText: 'Добавить слово',
                        icon: 'assets/iconss/plus.svg',

                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PopUpBox(popupContent: PopUpBodyWidget()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
