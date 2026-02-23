import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TestScreenBodyWidget extends StatefulWidget {
  final List<Word> wordList;
  final int topicId;
  final Color topicColor;

  const TestScreenBodyWidget({
    super.key,
    required this.wordList,
    required this.topicId,
    required this.topicColor,
  });

  @override
  State<TestScreenBodyWidget> createState() => _TestScreenBodyWidgetState();
}

class _TestScreenBodyWidgetState extends State<TestScreenBodyWidget> {
  final CardSwiperController controller = CardSwiperController();
  late final int wordsListLength;
  late List<Widget> wordsWidgetList;
  int progress = 0;
  int successfulGuesses = 0;
  int failedGuesses = 0;

  @override
  void initState() {
    wordsListLength = widget.wordList.length;
    wordsWidgetList = widget
        .wordList //There must be data
        .map(
          (word) => WidgetFlipper(
            frontWidget: FlashcardFrontSide(
              topicColor: widget.topicColor,
              wordPair: word,
              word: word.word,
              transcription: 'jam-kkan-man',
              lexicalCategory: '동사',
            ),
            backWidget: FlashcardBackside(
              topicColor: widget.topicColor,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  height: 6,
                  child: LinearProgressIndicator(
                    backgroundColor: AppConst.dialogbackground,
                    color: widget.topicColor,
                    value: progress / wordsListLength,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).height * .6,
                child: CardSwiper(
                  controller: controller,
                  threshold: 70,
                  cardsCount: wordsWidgetList.length,
                  onSwipe: _onSwipe,
                  onEnd: () => AutoRouter.of(context).pop(),
                  allowedSwipeDirection: AllowedSwipeDirection.only(
                    left: true,
                    right: true,
                  ),
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

  Future<bool> _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) async {
    setState(() {
      progress++;
      if (direction == CardSwiperDirection.right) {
        successfulGuesses++;
      } else if (direction == CardSwiperDirection.left) {
        failedGuesses++;
      }
    });
    return true;
  }

  Future<void> _onEnd(BuildContext pageContext) async {
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => FinishedTestBodyWidget(
        successfulGuesses: successfulGuesses,
        failedGuesses: failedGuesses,
        wordsListLength: wordsListLength,
      ),
    ).then((_) => AutoRouter.of(pageContext).pop());
  }
}
