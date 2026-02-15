import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicBodyWidget extends StatelessWidget {
  final TopicSummary topic;
  final Color color;
  final double cardHeight;
  const TopicBodyWidget({
    super.key,
    required this.topic,
    required this.color,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final progress = topic.totalWords == 0
        ? 0.0
        : topic.learnedWords / topic.totalWords;
    final roundedProgress = (progress * 100).round();
    return SizedBox(
      height: cardHeight,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatRussianWordCount(topic.totalWords),
                      style: AppConst.additionalText,
                    ),
                    Text(topic.topicName, style: AppConst.h2),
                  ],
                ),
              ),
              roundedProgress == 100
                  ? SizedBox(
                      width: 40,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .6),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            'assets/iconss/knowledge_button.svg',
                            color: color,
                          ),
                        ),
                      ),
                    )
                  : CircularProgressBar(
                      width: 40,
                      height: 40,
                      indicatorColor: color,
                      backgroundColor: const Color(0x60ffffff),
                      progress: progress,
                      accomplishment: Text(
                        '$roundedProgress%',
                        style: AppConst.additionalText,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
