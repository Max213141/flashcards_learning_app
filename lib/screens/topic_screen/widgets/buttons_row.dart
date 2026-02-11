import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_learning_app/router/app_router.dart' as appRouter;

class ButtonsRow extends StatelessWidget {
  final int topicId;
  const ButtonsRow({super.key, required this.topicId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 145,
            child: CustomActionButton(
              buttonText: 'Практика',
              onTap: () => AutoRouter.of(context).push(appRouter.TestRoute()),
            ),
          ),
          SizedBox(
            width: 145,

            child: CustomActionButton(
              buttonText: 'Экзамен',
              onTap: () => AutoRouter.of(context).push(appRouter.TestRoute()),
            ),
          ),
        ],
      ),
    );
  }
}
