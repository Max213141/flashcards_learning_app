import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

@RoutePage()
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final Future<List<Word>> _wordsFuture;
  final CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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

          List<Widget> wordsWidgetList = words
              .map(
                (word) => WidgetFlipper(
                  frontWidget: FlashcardFrontSide(
                    wordPair: word,
                    word: word.word,
                    transcription: 'jam-kkan-man',
                    lexicalCategory: '동사',
                  ),
                  backWidget: FlashcardSide(word: words[0].translation),
                ),
              )
              .toList();

          return Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .6,
                      child: CardSwiper(
                        controller: controller,
                        cardsCount: words.length,
                        onSwipe: _onSwipe,
                        onUndo: _onUndo,
                        isLoop: false,
                        numberOfCardsDisplayed: 1,
                        padding: const EdgeInsets.all(24.0),
                        cardBuilder:
                            (
                              context,
                              index,
                              horizontalThresholdPercentage,
                              verticalThresholdPercentage,
                            ) => wordsWidgetList[index],
                      ),
                    ),

                    WordDescriptionWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('The card $currentIndex was undod from the ${direction.name}');
    return true;
  }
}
