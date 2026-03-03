import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/exam_screen_body_widget.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ExamScreen extends StatefulWidget {
  final int topicId;
  const ExamScreen({super.key, required this.topicId});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late Future<List<Word>> _wordsFuture;
  final appDatabase = getIt<AppDatabase>();

  @override
  void initState() {
    super.initState();
    _wordsFuture = appDatabase.getWordsForTopic(widget.topicId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsetsGeometry.all(10),
            child: SvgPicture.asset(
              'assets/iconss/arrow_back.svg',
              colorFilter: const ColorFilter.mode(
                AppConst.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Экзамен', style: AppConst.h3),
      ),
      body: FutureBuilder<List<Word>>(
        future: _wordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: FlashcardsLoader());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final words = snapshot.data ?? [];

          return ExamScreenBodyWidget(wordList: words);
        },
      ),
    );
  }
}
