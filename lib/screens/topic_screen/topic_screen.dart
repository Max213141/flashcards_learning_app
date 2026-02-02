import 'dart:convert';

import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/circle_custom_action_button.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/slidable_word_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  late final Future<List<Word>> _wordsFuture;

  @override
  void initState() {
    super.initState();
    _wordsFuture = _loadWords();
  }

  Future<List<Word>> _loadWords() async {
    final response = await rootBundle.loadString('assets/mock_data.json');
    final decoded = jsonDecode(response) as List<dynamic>;
    return decoded.map((e) => Word.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: CircleCustomActionButton(),
      body: FutureBuilder<List<Word>>(
        future: _wordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final words = snapshot.data!;
          if (words.isEmpty) {
            return const Center(child: Text('No words found'));
          }
          return Column(
            children: [
              // DecoratedBox(
              //   decoration: BoxDecoration(
              //     color: AppConst.primary,
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(35),
              //       bottomRight: Radius.circular(35),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(30.0),
              //     child: DecoratedBox(
              //       decoration: BoxDecoration(
              //         color: AppConst.transparent,
              //         borderRadius: BorderRadius.circular(35),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 28.0,
              //           vertical: 10,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Глаголы действия', style: AppConst.h2),
              //                 Text('140 слов', style: AppConst.additionalText),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 50,
              //               height: 50,
              //               child: DecoratedBox(
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: Color(0xffffffff),
              //                 ),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(7.0),
              //                   child: Stack(
              //                     alignment: AlignmentGeometry.center,
              //                     children: [
              //                       CircularProgressIndicator(
              //                         value: 0.5,
              //                         strokeWidth: 4,
              //                         strokeCap: StrokeCap.round,

              //                         color: AppConst.lavender,
              //                       ),
              //                       Text('50%', style: AppConst.additionalText),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Text('Общий \nпрогресс', style: AppConst.text),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0, bottom: 40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       CustomActionButton(buttonText: 'Практика', width: 145),
              //       CustomActionButton(buttonText: 'Экзамен', width: 145),
              //     ],
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 85,
                  ),
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      return SlidableWordWidget(
                        index: index,
                        word: words[index].word,
                        translation: words[index].translation,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
