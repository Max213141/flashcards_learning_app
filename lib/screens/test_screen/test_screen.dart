import 'dart:convert';

import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/utils/rotation_widget/widget_flipper.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/flashcard_backside.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/flashcard_frontside.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
      appBar: AppBar(title: const Text('Практика')),
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

          return Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  WidgetFlipper(
                    frontWidget: FlashcardFrontSide(
                      word: words[0].translatedWord,
                      transcription: 'jam-kkan-man',
                    ),
                    backWidget: FlashcardSide(word: words[0].originWord),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 234, 255, 60),
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          color: Color.fromRGBO(168, 157, 239, 100),
                        ),
                      ),

                      child: Theme(
                        data: Theme.of(context).copyWith(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          title: Text('Слово в употреблении'),
                          leading: Icon(Icons.leak_remove_sharp),
                          shape: Border.all(color: Colors.transparent),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text('Example sentence'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
