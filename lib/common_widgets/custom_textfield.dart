import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  const CustomTextfield({super.key, required this.controller, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppConst.text,
      maxLength: maxLength,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD7D7D7)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppConst.black.withValues(alpha: .3)),
        ),
        // errorBorder: UnderlineInputBorder(
        // borderSide: BorderSide(color: Color(0xffD7D7D7))
        // ),
      ),
    );
  }
}
