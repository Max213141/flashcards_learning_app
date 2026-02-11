import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/edit_word_form.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
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

  void _reoloadDB() {
    setState(() {
      _wordsFuture = appDatabase.getWordsForTopic(widget.topicId);
    });
  }

  void _onEdit(Word wordInfo) async {
    final wordId = wordInfo.id ?? -1;
    if (wordId < 0) return;
    final fresh = await appDatabase.getWordById(wordId);
    if (!mounted || fresh == null) return;
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => EditWordDialog(
        word: fresh,
        onSave: () => Navigator.of(context).pop(true),
      ),
    );
    if (result == true && mounted) {
      _reoloadDB();
    }
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

              ButtonsRow(topicId: widget.topicId),

              TopicWordsListWidget(
                wordsList: words,
                topicName: widget.topicName,
                deleteWord: _deleteWord,
                editWord: _onEdit,
                reloadDB: _reoloadDB,
              ),
            ],
          );
        },
      ),
    );
  }
}
