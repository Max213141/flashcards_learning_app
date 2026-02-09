import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/app_bar.dart';
import 'package:flashcards_learning_app/common_widgets/circular_progress_bar.dart';
import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/circle_custom_action_button.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/slidable_word_widget.dart';
import 'package:flashcards_learning_app/router/app_router.dart' as appRouter;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class TopicScreen extends StatefulWidget {
  final String topicName;
  final List<Word> words;
  const TopicScreen({super.key, required this.topicName, required this.words});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  // late final Future<List<Word>> _wordsFuture;

  @override
  void initState() {
    super.initState();
    // _wordsFuture = _loadWords();
  }

  // Future<List<Word>> _loadWords() async {
  //   final response = await rootBundle.loadString('assets/mock_data.json');
  //   final decoded = jsonDecode(response) as List<dynamic>;
  //   return decoded.map((e) => Word.fromJson(e)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: CircleCustomActionButton(),
      body: Column(
        children: [
          AppBarWidget(
            firstPart: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.topicName, style: AppConst.h2),
                Text('140 ckjd', style: AppConst.additionalText),
              ],
            ),

            secondPart: Row(
              children: [
                CircularProgressBar(
                  width: 50,
                  height: 50,
                  indicatorColor: AppConst.lavender,
                  accomplishment: Text('50%', style: AppConst.additionalText),
                ),
                Text('Общий \nпрогресс', style: AppConst.text),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomActionButton(
                  buttonText: 'Практика',

                  onTap: () =>
                      AutoRouter.of(context).push(const appRouter.TestRoute()),
                ),
                CustomActionButton(
                  buttonText: 'Экзамен',

                  onTap: () =>
                      AutoRouter.of(context).push(const appRouter.TestRoute()),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 85,
              ),
              child: ListView.builder(
                //TODO after deletion on Word item scrollable doesnt changes and breaking while scrolling
                itemCount: widget.words.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print('TAP');

                      AutoRouter.of(context).push(
                        WordDefinitionRoute(wordData: widget.words[index]),
                      );
                    },
                    child: SlidableWordWidget(
                      index: index,
                      word: widget.words[index].word,
                      translation: widget.words[index].translation,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
