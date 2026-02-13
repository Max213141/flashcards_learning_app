import 'package:flutter/material.dart';

class TextfieldPaddingWrapper extends StatelessWidget {
  final Widget textField;
  const TextfieldPaddingWrapper({super.key, required this.textField});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300, height: 40, child: textField);
  }
}
