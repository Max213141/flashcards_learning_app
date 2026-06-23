import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/utils/analytics_service.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
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
    final l10n = l10nOf(context);

    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 145,
            child: CustomActionButton(
              buttonText: l10n.buttonsRowPracticeButton,
              onTap: isTopicEmpty
                  ? null
                  : () {
                      getIt<AnalyticsService>().logPracticeStarted(
                        topicId: topicId,
                      );
                      AutoRouter.of(context).push(
                        app_router.TestRoute(
                          topicId: topicId,
                          topicColor: topicColor,
                        ),
                      );
                    },
            ),
          ),
          SizedBox(
            width: 145,

            child: CustomActionButton(
              buttonText: l10n.buttonsRowExamButton,
              onTap: isTopicEmpty
                  ? null
                  : () {
                      getIt<AnalyticsService>().logExamStarted(
                        topicId: topicId,
                      );
                      AutoRouter.of(
                        context,
                      ).push(app_router.ExamRoute(topicId: topicId));
                    },
            ),
          ),
        ],
      ),
    );
  }
}
