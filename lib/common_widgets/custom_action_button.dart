import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String buttonText;
  final double width;

  const CustomActionButton({
    super.key,
    required this.buttonText,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 55,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppConst.buttonBackground,
          foregroundColor: AppConst.black,
          side: BorderSide(color: AppConst.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        onPressed: () {
          print('s');
        },
        child: Text(buttonText, style: AppConst.text),
      ),
    );
  }
}
