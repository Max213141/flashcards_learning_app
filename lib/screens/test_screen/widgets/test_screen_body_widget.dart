import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TestScreenBodyWidget extends StatefulWidget {
  const TestScreenBodyWidget({super.key});

  @override
  State<TestScreenBodyWidget> createState() => _TestScreenBodyWidgetState();
}

class _TestScreenBodyWidgetState extends State<TestScreenBodyWidget> {
  final CardSwiperController controller = CardSwiperController();
  late List<Widget> wordsWidgetList;

  @override
  void initState() {
    wordsWidgetList =
        [] //There must be data
            .map(
              (word) => WidgetFlipper(
                frontWidget: FlashcardFrontSide(
                  wordPair: word,
                  word: word.word,
                  transcription: 'jam-kkan-man',
                  lexicalCategory: '동사',
                ),
                backWidget: FlashcardBackside(
                  translation: word.translation,
                  wordPair: word,
                ),
              ),
            )
            .toList();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  cardsCount: wordsWidgetList.length,
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
