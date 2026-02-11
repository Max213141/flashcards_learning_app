import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TopicWordsListWidget extends StatefulWidget {
  final List<Word> wordsList;
  final String topicName;
  final VoidCallback reloadDB;
  final void Function(Word) editWord;

  final Future<void> Function(int) deleteWord;
  const TopicWordsListWidget({
    super.key,
    required this.wordsList,
    required this.topicName,
    required this.deleteWord,
    required this.reloadDB,
    required this.editWord,
  });

  @override
  State<TopicWordsListWidget> createState() => _TopicWordsListWidgetState();
}

class _TopicWordsListWidgetState extends State<TopicWordsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 85,
        ),
        child: widget.wordsList.isEmpty
            ? const Center(child: Text('Нет слов'))
            : Scrollbar(
                child: ListView.builder(
                  itemCount: widget.wordsList.length,
                  itemBuilder: (context, index) {
                    final word = widget.wordsList[index];
                    return InkWell(
                      onTap: () async {
                        final result = await AutoRouter.of(context).push(
                          WordDefinitionRoute(
                            topicName: widget.topicName,
                            wordData: word,
                          ),
                        );
                        if (result == true && mounted) {
                          widget.reloadDB();
                        }
                      },
                      child: SlidableWordWidget(
                        index: index,
                        wordId: word.id ?? word.hashCode,
                        word: word.word,
                        translation: word.translation,
                        onEdit: () => widget.editWord(word),
                        onDelete: () => widget.deleteWord(word.id ?? -1),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
