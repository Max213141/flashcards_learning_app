import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class TopicsListWidget extends StatelessWidget {
  const TopicsListWidget({super.key});
  static const double cardHeight = 175;
  static const double overlap = 100;
  static const int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    final totalHeight = cardHeight + (itemCount - 1) * (cardHeight - overlap);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .6,
            child: SingleChildScrollView(
              child: SizedBox(
                height: totalHeight,
                child: Stack(
                  children: List.generate(itemCount, (index) {
                    return Positioned(
                      top: index * (cardHeight - overlap),
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () =>
                            AutoRouter.of(context).push(const TopicRoute()),
                        child: CustomPaint(
                          painter: MyPainter(),
                          child: const SizedBox(
                            height: cardHeight,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsetsGeometry.symmetric(
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
                                            '140 слов',
                                            style: AppConst.additionalText,
                                          ),
                                          Text(
                                            'Глаголы действия',
                                            style: AppConst.h2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CircularProgressBar(
                                      width: 40,
                                      height: 40,
                                      indicatorColor: AppConst.lavender,
                                      backgroundColor: Color(0x60ffffff),
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
  }
}
