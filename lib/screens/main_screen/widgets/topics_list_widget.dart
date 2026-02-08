import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class TopicsListWidget extends StatelessWidget {
  const TopicsListWidget({super.key, required this.topicsStream});
  final Stream<List<TopicSummary>> topicsStream;
  static const double cardHeight = 175;
  static const double overlap = 100;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TopicSummary>>(
      stream: topicsStream,
      builder: (context, snapshot) {
        final topics = snapshot.data ?? [];
        if (snapshot.connectionState == ConnectionState.waiting &&
            topics.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (topics.isEmpty) {
          return const Center(child: Text('No topics yet'));
        }

        final totalHeight =
            cardHeight + (topics.length - 1) * (cardHeight - overlap);

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .45,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: totalHeight,
                    child: Stack(
                      children: List.generate(topics.length, (index) {
                        final topic = topics[index];
                        final progress = topic.totalWords == 0
                            ? 0.0
                            : topic.learnedWords / topic.totalWords;
                        final Color color = topic.colorValue != null
                            ? Color(topic.colorValue!)
                            : Colors.white;
                        return Positioned(
                          top: index * (cardHeight - overlap),
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () =>
                                AutoRouter.of(context).push(const TopicRoute()),
                            child: CustomPaint(
                              painter: MyPainter(initialColor: color),
                              child: SizedBox(
                                height: cardHeight,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${topic.totalWords} слов',
                                                style: AppConst.additionalText,
                                              ),
                                              Text(
                                                topic.topicName,
                                                style: AppConst.h2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircularProgressBar(
                                          width: 40,
                                          height: 40,
                                          indicatorColor: AppConst.lavender,
                                          backgroundColor: const Color(
                                            0x60ffffff,
                                          ),
                                          progress: progress,
                                          accomplishment: Text(
                                            '${(progress * 100).round()}%',
                                            style: AppConst.additionalText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
