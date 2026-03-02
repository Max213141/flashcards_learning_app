import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/timer.dart';
import 'package:flutter/material.dart';

import '../../../entities/word.dart';

class ExamScreenBodyWidget extends StatefulWidget {
  final List<Word> wordList;
  const ExamScreenBodyWidget({super.key, required this.wordList});

  @override
  State<ExamScreenBodyWidget> createState() => _ExamScreenBodyWidgetState();
}

class _ExamScreenBodyWidgetState extends State<ExamScreenBodyWidget> {
  int? leftId;
  int? rightId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Clock()),
        Spacer(),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomActionButton(
                          buttonText: widget.wordList[index].word,
                          onTap: () {
                            setState(() {
                              leftId = widget.wordList[index].id;
                            });
                            if (leftId != null && rightId!= null) {
                              (leftId == rightId) 
                            }
                          },
                          color: leftId == widget.wordList[index].id
                              ? AppConst.primary
                              : AppConst.buttonBackground,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomActionButton(
                          buttonText: widget.wordList[index].translation,
                          onTap: () {
                            setState(() {
                              rightId = widget.wordList[index].id;
                            });
                          },
                          color: rightId == widget.wordList[index].id
                              ? AppConst.primary
                              : AppConst.buttonBackground,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
