import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleCustomActionButton extends StatefulWidget {
  const CircleCustomActionButton({super.key});

  @override
  State<CircleCustomActionButton> createState() =>
      _CircleCustomActionButtonState();
}

class _CircleCustomActionButtonState extends State<CircleCustomActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: IconButton(
        onPressed: () {},
        icon: SizedBox(
          height: 24,
          width: 24,

          child: SvgPicture.asset('assets/iconss/plus.svg'),
        ),
        color: AppConst.primary,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConst.primary, // lime / green
          shape: const CircleBorder(),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
