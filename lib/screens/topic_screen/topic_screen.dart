import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/app_bar.dart';
import 'package:flashcards_learning_app/common_widgets/circular_progress_bar.dart';
import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/circle_custom_action_button.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/slidable_word_widget.dart';
import 'package:flashcards_learning_app/router/app_router.dart' as appRouter;
import 'package:flashcards_learning_app/utils/pluralization.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: CircleCustomActionButton(),
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

          return Column(
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 145,
                      child: CustomActionButton(
                        buttonText: 'Практика',
                        onTap: () => AutoRouter.of(
                          context,
                        ).push(const appRouter.TestRoute()),
                      ),
                    ),
                    SizedBox(
                      width: 145,

                      child: CustomActionButton(
                        buttonText: 'Экзамен',
                        onTap: () => AutoRouter.of(
                          context,
                        ).push(const appRouter.TestRoute()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 85,
                  ),
                  child: words.isEmpty
                      ? const Center(child: Text('Нет слов'))
                      : Scrollbar(
                          child: ListView.builder(
                            // TODO: After deletion on Word item scrollable doesn't change and breaks while scrolling.
                            itemCount: words.length,
                            itemBuilder: (context, index) {
                              final word = words[index];
                              return InkWell(
                                onTap: () async {
                                  final result = await AutoRouter.of(context)
                                      .push(
                                        appRouter.WordDefinitionRoute(
                                          topicName: widget.topicName,
                                          wordData: word,
                                        ),
                                      );
                                  if (result == true && mounted) {
                                    setState(() {
                                      _wordsFuture = appDatabase
                                          .getWordsForTopic(widget.topicId);
                                    });
                                  }
                                },
                                child: SlidableWordWidget(
                                  index: index,
                                  wordId: word.id ?? word.hashCode,
                                  word: word.word,
                                  translation: word.translation,
                                  onDelete: () => _deleteWord(word.id ?? -1),
                                ),
                              );
                            },
                          ),
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
