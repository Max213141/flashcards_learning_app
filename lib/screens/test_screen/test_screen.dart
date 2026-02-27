import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class TestScreen extends StatefulWidget {
  final int topicId;
  final Color topicColor;
  const TestScreen({
    super.key,
    required this.topicId,
    required this.topicColor,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Future<List<Word>> _wordsFuture;

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
        title: Text('Практика', style: AppConst.h3),
      ),
      body: FutureBuilder<List<Word>>(
        future: _wordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final words = snapshot.data ?? [];

          return TestScreenBodyWidget(
            wordList: words,
            topicId: widget.topicId,
            topicColor: widget.topicColor,
          );
        },
      ),
    );
  }
}
