import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WordDefinitionScreenBody extends StatelessWidget {
  final Word wordData;
  final Color topicColor;
  final String topicName;
  final VoidCallback toggleLearned;
  final bool know;

  const WordDefinitionScreenBody({
    super.key,
    required this.wordData,
    required this.topicColor,
    required this.topicName,
    required this.toggleLearned,
    required this.know,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              wordData.word,
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
          ),
          Text(wordData.transcription ?? '', style: AppConst.text),
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints.expand(width: 355, height: 475),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppConst.white,
                border: Border.all(width: 12, color: topicColor),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wordData.partOfSpeech ??
                            l10n.wordDefinitionPartOfSpeechMissing,
                        style: wordData.partOfSpeech == null
                            ? AppConst.additionalText.copyWith(fontSize: 12)
                            : AppConst.text,
                      ),
                      SizedBox(height: 15),
                      Text(
                        l10n.wordDefinitionTranslationTitle,
                        style: AppConst.h2,
                      ),
                      Text(wordData.translation, style: AppConst.text),
                      SizedBox(height: 15),
                      Text(l10n.wordDefinitionUsageTitle, style: AppConst.h2),
                      Text(
                        wordData.usage ?? l10n.wordDefinitionInfoMissing,
                        style: wordData.usage == null
                            ? AppConst.additionalText.copyWith(fontSize: 12)
                            : AppConst.text,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(topicName, style: AppConst.h2),
                          GestureDetector(
                            onTap: () async {
                              toggleLearned();
                            },
                            child: SvgPicture.asset(
                              'assets/iconss/knowledge_button.svg',
                              width: 65,
                              height: 65,
                              colorFilter: ColorFilter.mode(
                                know ? topicColor : AppConst.background,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
