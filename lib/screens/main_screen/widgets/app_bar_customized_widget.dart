import 'dart:async';

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
  late final Stream<UserGoals?> _goalsStream;
  late Stream<({int totalWords, int learnedWords, int learnedToday})>
  _progressStream;
  Timer? _midnightRefreshTimer;

  @override
  void initState() {
    super.initState();
    _goalsStream = appDatabase.watchUserGoals();
    _reloadProgressStream();
    _scheduleMidnightRefresh();
  }

  @override
  void dispose() {
    _midnightRefreshTimer?.cancel();
    super.dispose();
  }

  void _reloadProgressStream() {
    _progressStream = appDatabase.watchWordsProgressStats();
  }

  void _scheduleMidnightRefresh() {
    _midnightRefreshTimer?.cancel();
    final now = DateTime.now();
    final nextMidnight = DateTime(
      now.year,
      now.month,
      now.day + 1,
    );
    final delay = nextMidnight.difference(now);
    _midnightRefreshTimer = Timer(delay, () {
      if (!mounted) return;
      setState(() {
        _reloadProgressStream();
      });
      _scheduleMidnightRefresh();
    });
  }

  Future<void> _addGoals(UserGoals? currentGoals) async {
    if (!mounted) return;

    await showDialog<bool>(
      context: context,
      builder: (context) => PopUpBox(
        popupContent: GoalsDialogBodyWidget(currentGoals: currentGoals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserGoals?>(
      stream: _goalsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final currentUserGoals = snapshot.data;

        return StreamBuilder<
          ({int totalWords, int learnedWords, int learnedToday})
        >(
          stream: _progressStream,
          builder: (context, progressSnapshot) {
            if (progressSnapshot.connectionState == ConnectionState.waiting &&
                !progressSnapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (progressSnapshot.hasError) {
              return Center(child: Text('Error: ${progressSnapshot.error}'));
            }

            final progressData = progressSnapshot.data;
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
            final overallProgressPercent =
                overallGoal == 0 ? 0 : (overallProgress * 100).round();

            return GestureDetector(
              onTap: () => _addGoals(currentUserGoals),
              child: AppBarWidget(
                firstPart: currentUserGoals == null
                    ? Row(
                        children: [
                          FittedBox(
                            child: Text(
                              'Поставь себе цели!',
                              style: AppConst.text,
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
                          FittedBox(
                            child: Text(
                              'Общий \nпрогресс',
                              style: AppConst.text,
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
                          FittedBox(
                            child: Text(
                              'Дневная \nцель',
                              style: AppConst.text,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
