import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Dialog(
        shadowColor: Colors.black.withValues(alpha: 0.2),
        insetPadding: EdgeInsets.symmetric(horizontal: 14),
        backgroundColor: Color(0xffF7F9E6),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: PopUpBodyWidget(),
          ),
        ),
      ),
    );
  }
}
