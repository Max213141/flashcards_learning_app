import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class ScaledText extends StatelessWidget {
  final String value;
  final double maxWidth;

  const ScaledText({super.key, required this.value, this.maxWidth = 280});

  double _fontByLength(int length) {
    if (length <= 10) return 56;
    if (length <= 16) return 46;
    if (length <= 24) return 38;
    if (length <= 70) return 20;

    return 32;
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = _fontByLength(value.length);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: 72),
      child: Text(
        value,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppConst.h1.copyWith(fontSize: fontSize, height: 1.05),
      ),
    );
  }
}
