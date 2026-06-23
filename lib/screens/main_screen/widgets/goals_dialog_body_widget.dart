import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalsDialogBodyWidget extends StatefulWidget {
  const GoalsDialogBodyWidget({super.key});

  @override
  State<GoalsDialogBodyWidget> createState() => _GoalsDialogBodyWidgetState();
}

class _GoalsDialogBodyWidgetState extends State<GoalsDialogBodyWidget> {
  late final TextEditingController totalController;
  late final TextEditingController dailyController;

  @override
  void initState() {
    super.initState();
    final state = context.read<GoalsBloc>().state;
    totalController = TextEditingController(text: state.totalGoalInput);
    dailyController = TextEditingController(text: state.dailyGoalInput);
  }

  @override
  void dispose() {
    totalController.dispose();
    dailyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoalsBloc, GoalsState>(
      listener: (context, state) {
        if (totalController.text != state.totalGoalInput) {
          totalController.value = TextEditingValue(
            text: state.totalGoalInput,
            selection: TextSelection.collapsed(
              offset: state.totalGoalInput.length,
            ),
          );
        }
        if (dailyController.text != state.dailyGoalInput) {
          dailyController.value = TextEditingValue(
            text: state.dailyGoalInput,
            selection: TextSelection.collapsed(
              offset: state.dailyGoalInput.length,
            ),
          );
        }

        if (state.status == GoalsStatus.saveSuccess) {
          Navigator.of(context).pop(true);
          context.read<GoalsBloc>().add(const GoalsEvent.statusConsumed());
          return;
        }

        if (state.status == GoalsStatus.failure && state.message != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
          context.read<GoalsBloc>().add(const GoalsEvent.statusConsumed());
        }
      },
      builder: (context, state) {
        final l10n = l10nOf(context);
        final canSave =
            totalController.text.trim().isNotEmpty &&
            dailyController.text.trim().isNotEmpty &&
            !state.isSaving;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(l10n.goalsDialogTitle, style: AppConst.h1)),
            const SizedBox(height: 24),
            Text(l10n.goalsDialogOverallGoalLabel, style: AppConst.h2),
            CustomTextfield(
              controller: totalController,
              digitsOnly: true,
              maxLength: 5,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            Text(l10n.goalsDialogDailyGoalLabel, style: AppConst.h2),
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
                  buttonText: l10n.goalsDialogSaveButton,
                  color: canSave
                      ? AppConst.buttonBackground
                      : const Color(0x40D7D7D7),
                  borderColor: canSave ? AppConst.primary : Colors.transparent,
                  borderWidth: canSave ? 2 : 0,
                  onTap: () {
                    if (!canSave) return;
                    context.read<GoalsBloc>().add(
                      GoalsEvent.saveRequested(
                        totalGoal: totalController.text,
                        dailyGoal: dailyController.text,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
