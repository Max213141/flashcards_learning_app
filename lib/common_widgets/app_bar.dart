import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget firstPart;
  final Widget? secondPart;
  const AppBarWidget({super.key, required this.firstPart, this.secondPart});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppConst.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' Статистика', style: AppConst.text),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppConst.transparent,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: firstPart),
                      SizedBox(width: 20),
                      if (secondPart != null) Expanded(child: secondPart!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
