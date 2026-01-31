import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppConst.primary),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppConst.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Глаголы действия', style: AppConst.h2),
                          Text('140 слов', style: AppConst.additionalText),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffffff),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Stack(
                              alignment: AlignmentGeometry.center,
                              children: [
                                CircularProgressIndicator(
                                  value: 0.5,
                                  strokeWidth: 4,
                                  strokeCap: StrokeCap.round,

                                  color: AppConst.lavender,
                                ),
                                Text('50%', style: AppConst.additionalText),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text('Общий \nпрогресс', style: AppConst.text),
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
