import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActionButton extends StatelessWidget {
  final String buttonText;
  // final double width;
  final VoidCallback onTap;
  final String? icon;

  const CustomActionButton({
    super.key,
    required this.buttonText,
    // required this.width,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        // width: width,
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
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Expanded(
                  child: SvgPicture.asset(
                    icon!,
                    width: 24,
                    color: AppConst.black,
                  ),
                ),
              SizedBox(width: 5),

              Text(buttonText, style: AppConst.text),
            ],
          ),
        ),
      ),
    );
  }
}
