import 'package:flutter/material.dart';

class FlashcardSide extends StatelessWidget {
  final String word;
  const FlashcardSide({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 12,
            color: Color.fromRGBO(174, 192, 111, 100),
          ),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Column(
          children: [
            Spacer(flex: 1),

            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 5),
                child: Icon(Icons.access_alarm_outlined),
              ),
            ),
            Spacer(flex: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.0),
              child: Text(word, maxLines: 5, textAlign: TextAlign.center),
            ),
            Spacer(flex: 15),
          ],
        ),
      ),
    );
  }
}
