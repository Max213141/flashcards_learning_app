import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
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
          return Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Text('Нет ни одной темы', style: AppConst.text),
          );
        }

        final totalHeight =
            cardHeight + (topics.length - 1) * (cardHeight - overlap);

        return Padding(
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

                      final Color color = topic.colorValue != null
                          ? Color(topic.colorValue!)
                          : Colors.white;
                      return Positioned(
                        top: index * (cardHeight - overlap),
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => AutoRouter.of(context).push(
                            TopicRoute(
                              topicName: topic.topicName,
                              topicId: topic.id,
                            ),
                          ),
                          child: CustomPaint(
                            painter: MyPainter(initialColor: color),
                            child: TopicBodyWidget(
                              topic: topic,
                              color: color,
                              cardHeight: cardHeight,
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
        );
      },
    );
  }
}
