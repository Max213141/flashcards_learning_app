import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCustomizedWidget extends StatefulWidget {
  const AppBarCustomizedWidget({super.key});

  @override
  State<AppBarCustomizedWidget> createState() => _AppBarCustomizedWidgetState();
}

class _AppBarCustomizedWidgetState extends State<AppBarCustomizedWidget> {
  late Future<({UserGoals? goals, int totalWords, int learnedWords})>
  _currentDataFuture;

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  Future<({UserGoals? goals, int totalWords, int learnedWords})>
  _loadCurrentData() async {
    final goals = await appDatabase.getUserGoals();
    final progress = await appDatabase.getWordsProgressStats();
    return (
      goals: goals,
      totalWords: progress.totalWords,
      learnedWords: progress.learnedWords,
    );
  }

  void _reloadData() {
    _currentDataFuture = _loadCurrentData();
  }

  Future<void> _addGoals(UserGoals? currentGoals) async {
    if (!mounted) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => PopUpBox(
        popupContent: GoalsDialogBodyWidget(currentGoals: currentGoals),
      ),
    );

    if (result == true && mounted) {
      setState(() {
        _reloadData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<
      ({UserGoals? goals, int totalWords, int learnedWords})
    >(
      future: _currentDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data;
        final currentUserGoals = data?.goals;
        final overallGoal = data?.goals?.overallGoal ?? 0;
        final learnedWords = data?.learnedWords ?? 0;
        final overallProgress = overallGoal == 0
            ? 0.0
            : learnedWords / overallGoal;
        final overallProgressPercent = (overallProgress * 100).round();
        return GestureDetector(
          onTap: () => _addGoals(currentUserGoals),
          child: AppBarWidget(
            firstPart: currentUserGoals == null
                ? Row(
                    children: [
                      FittedBox(
                        child: Text('Поставь себе цели!', style: AppConst.text),
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
                      FittedBox(
                        child: Text('Общий \nпрогресс', style: AppConst.text),
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
                        accomplishment: FancyAccomplishmentText(
                          dailyGoal: currentUserGoals.dailyGoal,
                        ),
                      ),
                      SizedBox(width: 10),
                      FittedBox(
                        child: Text('Дневная \nцель', style: AppConst.text),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
