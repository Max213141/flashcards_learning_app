import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class PopUpBox extends StatelessWidget {
  final Widget popupContent;
  const PopUpBox({super.key, required this.popupContent});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Dialog(
        shadowColor: Colors.black.withValues(alpha: 0.2),
        insetPadding: EdgeInsets.symmetric(horizontal: 14),
        backgroundColor: AppConst.dialogbackground,
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: popupContent,
          ),
        ),
      ),
    );
  }
}
