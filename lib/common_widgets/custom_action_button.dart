import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActionButton extends StatelessWidget {
  final String buttonText;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback onTap;
  final String? icon;

  const CustomActionButton({
    super.key,
    required this.buttonText,

    // required this.width,
    required this.onTap,
    this.icon,
    this.color = AppConst.buttonBackground,
    this.borderColor = AppConst.primary,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: SizedBox(
        // width: width,
        height: 55,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: color,
            foregroundColor: AppConst.black,
            side: BorderSide(color: borderColor!, width: borderWidth!),
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

                    colorFilter: const ColorFilter.mode(
                      AppConst.black,
                      BlendMode.srcIn,
                    ),
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
