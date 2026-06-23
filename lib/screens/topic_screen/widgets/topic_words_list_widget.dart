import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/analytics_service.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

class TopicWordsListWidget extends StatefulWidget {
  final List<Word> wordsList;
  final String topicName;
  final int topicId;
  final VoidCallback reloadDB;
  final Color topicColor;
  final void Function(Word) editWord;

  final Future<void> Function(int) deleteWord;
  const TopicWordsListWidget({
    super.key,
    required this.wordsList,
    required this.topicName,
    required this.topicId,
    required this.deleteWord,
    required this.reloadDB,
    required this.editWord,
    required this.topicColor,
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
            ? Center(
                child: Text(
                  l10nOf(context).topicWordsEmpty,
                  style: AppConst.text,
                ),
              )
            : Scrollbar(
                child: ListView.builder(
                  itemCount: widget.wordsList.length,
                  itemBuilder: (context, index) {
                    final word = widget.wordsList[index];
                    return InkWell(
                      onTap: () async {
                        getIt<AnalyticsService>().logWordOpened(
                          topicId: widget.topicId,
                          word: word,
                        );
                        final result = await AutoRouter.of(context).push(
                          WordDefinitionRoute(
                            topicName: widget.topicName,
                            wordData: word,
                            topicColor: widget.topicColor,
                          ),
                        );
                        if (result == true && mounted) {
                          widget.reloadDB();
                        }
                      },
                      child: SlidableWordWidget(
                        index: index,
                        wordEntity: word,
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
