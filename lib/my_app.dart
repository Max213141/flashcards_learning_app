import 'dart:convert';

import 'package:flashcards_learning_app/flashcard_side.dart';
import 'package:flashcards_learning_app/rotation_widget/widget_flipper.dart';
import 'package:flashcards_learning_app/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Word> wordsList = [];

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: WidgetFlipper(
          frontWidget: FlashcardSide(word: wordsList[0].originWord),
          backWidget: FlashcardSide(word: wordsList[0].translatedWord),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
