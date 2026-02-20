import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/entities/user_goals.dart';

import 'package:flutter/material.dart';

class GoalsDialogBodyWidget extends StatefulWidget {
  final UserGoals? currentGoals;
  const GoalsDialogBodyWidget({super.key, this.currentGoals});

  @override
  State<GoalsDialogBodyWidget> createState() => _GoalsDialogBodyWidgetState();
}

class _GoalsDialogBodyWidgetState extends State<GoalsDialogBodyWidget> {
  late final TextEditingController totalController;
  late final TextEditingController dailyController;
  @override
  void initState() {
    totalController = TextEditingController(
      text: widget.currentGoals?.overallGoal.toString() ?? '',
    );
    dailyController = TextEditingController(
      text: widget.currentGoals?.dailyGoal.toString() ?? '',
    );

    super.initState();
  }

  @override
  void dispose() {
    totalController.dispose();
    dailyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canSave =
        totalController.text.trim().isNotEmpty &&
        dailyController.text.trim().isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text('Цели обучения', style: AppConst.h1)),
        const SizedBox(height: 24),
        Text('Общая цель', style: AppConst.h2),
        CustomTextfield(
          controller: totalController,
          digitsOnly: true,
          maxLength: 5,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 16),
        Text('Дневная цель', style: AppConst.h2),
        CustomTextfield(
          controller: dailyController,
          digitsOnly: true,
          maxLength: 3,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 240,
            child: CustomActionButton(
              buttonText: 'Сохранить',
              color: canSave
                  ? AppConst.buttonBackground
                  : const Color(0x40D7D7D7),
              borderColor: canSave ? AppConst.primary : Colors.transparent,
              borderWidth: canSave ? 2 : 0,
              onTap: () async {
                if (!canSave) return;
                final overallGoal =
                    int.tryParse(totalController.text.trim()) ?? 0;
                final dailyGoal =
                    int.tryParse(dailyController.text.trim()) ?? 0;
                await appDatabase.saveUserGoals(
                  UserGoals(overallGoal: overallGoal, dailyGoal: dailyGoal),
                );
                if (!context.mounted) return;
                Navigator.of(context).pop(true);
              },
            ),
          ),
        ),
      ],
    );
  }
}
