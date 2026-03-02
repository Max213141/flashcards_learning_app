import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_learning_app/router/app_router.dart' as app_router;

class ButtonsRow extends StatelessWidget {
  final int topicId;
  final Color topicColor;
  final bool isTopicEmpty;

  const ButtonsRow({
    super.key,
    required this.topicId,
    required this.topicColor,
    required this.isTopicEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 145,
            child: CustomActionButton(
              buttonText: 'Практика',
              onTap: isTopicEmpty
                  ? null
                  : () => AutoRouter.of(context).push(
                      app_router.TestRoute(
                        topicId: topicId,
                        topicColor: topicColor,
                      ),
                    ),
            ),
          ),
          SizedBox(
            width: 145,

            child: CustomActionButton(
              buttonText: 'Экзамен',
              onTap: isTopicEmpty
                  ? null
                  : () => AutoRouter.of(
                      context,
                    ).push(app_router.ExamRoute(topicId: topicId)),
            ),
          ),
        ],
      ),
    );
  }
}
