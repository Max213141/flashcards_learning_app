import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCustomizedWidget extends StatelessWidget {
  const AppBarCustomizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsBloc, GoalsState>(
      builder: (context, state) {
        final l10n = l10nOf(context);

        if (state.isLoading &&
            state.currentGoals == null &&
            state.progressStats == null) {
          return const Center(child: FlashcardsLoader());
        }

        final currentUserGoals = state.currentGoals;
        final progressData = state.progressStats;
        final overallGoal = currentUserGoals?.overallGoal ?? 0;
        final dailyGoal = currentUserGoals?.dailyGoal ?? 0;
        final learnedWords = progressData?.learnedWords ?? 0;
        final learnedToday = progressData?.learnedToday ?? 0;
        final overallProgress = overallGoal == 0
            ? 0.0
            : (learnedWords / overallGoal).clamp(0.0, 1.0).toDouble();
        final dailyProgress = dailyGoal == 0
            ? 0.0
            : (learnedToday / dailyGoal).clamp(0.0, 1.0).toDouble();
        final overallProgressPercent = overallGoal == 0
            ? 0
            : (overallProgress * 100).round();

        return GestureDetector(
          onTap: () => showDialog<bool>(
            context: context,
            builder: (dialogContext) => BlocProvider.value(
              value: context.read<GoalsBloc>(),
              child: const PopUpBox(popupContent: GoalsDialogBodyWidget()),
            ),
          ),
          child: AppBarWidget(
            firstPart: currentUserGoals == null
                ? Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            l10n.mainAppBarSetGoalsPrompt,
                            style: AppConst.text,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          'assets/iconss/tap_icon.svg',
                          colorFilter: const ColorFilter.mode(
                            AppConst.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      CircularProgressBar(
                        width: 50,
                        height: 50,
                        indicatorColor: AppConst.lavender,
                        progress: overallProgress,
                        accomplishment: Text(
                          '$overallProgressPercent%',
                          style: AppConst.additionalText,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            l10n.mainAppBarOverallProgressLabel,
                            style: AppConst.text,
                          ),
                        ),
                      ),
                    ],
                  ),
            secondPart: currentUserGoals == null
                ? null
                : Row(
                    children: [
                      CircularProgressBar(
                        width: 50,
                        height: 50,
                        indicatorColor: AppConst.primary,
                        progress: dailyProgress,
                        accomplishment: FancyAccomplishmentText(
                          currentDailyLearned: learnedToday,
                          dailyGoal: dailyGoal,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            l10n.mainAppBarDailyGoalLabel,
                            style: AppConst.text,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
