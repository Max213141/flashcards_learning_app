import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD7D7D7)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppConst.black),
        ),
        // errorBorder: UnderlineInputBorder(
        // borderSide: BorderSide(color: Color(0xffD7D7D7))
        // ),
      ),
    );
  }
}
