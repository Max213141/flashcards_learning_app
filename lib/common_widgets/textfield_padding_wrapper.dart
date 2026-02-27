import 'package:flutter/material.dart';

class TextfieldPaddingWrapper extends StatelessWidget {
  final Widget textField;
  final double? height;
  const TextfieldPaddingWrapper({
    super.key,
    required this.textField,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    if (height == null) {
      return textField;
    }
    return SizedBox(height: height, child: textField);
  }
}
