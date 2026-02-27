import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFlipingIcon extends StatelessWidget {
  final bool isExpanded;
  const CustomFlipingIcon({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isExpanded ? 0.5 : 0.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      child: SvgPicture.asset(
        'assets/iconss/unfold.svg',
        height: 28,
        colorFilter: const ColorFilter.mode(AppConst.black, BlendMode.srcIn),
      ),
    );
  }
}
