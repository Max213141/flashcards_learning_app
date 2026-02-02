import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color indicatorColor;
  const CircularProgressBar({
    super.key,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              CircularProgressIndicator(
                value: 0.5,
                strokeWidth: 4,
                strokeCap: StrokeCap.round,

                color: indicatorColor,
              ),
              Text('50%', style: AppConst.additionalText),
            ],
          ),
        ),
      ),
    );
  }
}
