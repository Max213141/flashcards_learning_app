import 'dart:convert';

import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/rotation_widget/widget_flipper.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/flashcard_side.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Word> wordsList = [];
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    String response = await rootBundle.loadString('assets/mock_data.json');

    final decoded = jsonDecode(response) as List<dynamic>;

    List<Word> myWordsListFromJson(List<dynamic> jsonList) {
      return jsonList.map((dynamic json) => Word.fromJson(json)).toList();
    }

    final preparedWordList = myWordsListFromJson(decoded);
    print(preparedWordList[0].originWord);
    setState(() {
      wordsList = preparedWordList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Практика')),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 50),
          child: Column(
            children: [
              WidgetFlipper(
                frontWidget: FlashcardSide(word: wordsList[0].originWord),
                backWidget: FlashcardSide(word: wordsList[0].translatedWord),
              ),
              ExpansionTile(
                title: Text('Слово в употреблении'),
                leading: Icon(Icons.abc),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Example sentence'),
                  ),
                ],
              ),
              // ExpansionPanelList(
              //   expansionCallback: (index, isExpanded) {
              //     setState(() => _isExpanded = !isExpanded);
              //   },
              //   children: [
              //     ExpansionPanel(
              //       isExpanded: _isExpanded,
              //       headerBuilder: (context, isOpen) {
              //         return ListTile(title: Text('Слово в употреблении'));
              //       },
              //       body: Padding(
              //         padding: EdgeInsets.all(16),
              //         child: Text('Example sentence'),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
