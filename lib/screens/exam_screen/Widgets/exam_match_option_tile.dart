import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamMatchOptionTile extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isDisabled;
  final bool isMatched;
  final String? icon;
  final double height;
  final TextStyle? textStyle;

  const ExamMatchOptionTile({
    super.key,
    required this.text,
    this.onTap,
    this.isSelected = false,
    this.isDisabled = false,
    this.isMatched = false,
    this.icon,
    this.height = 55,
    this.textStyle,
  });

  bool get _isInteractive => onTap != null && !isDisabled && !isMatched;

  Color get _backgroundColor {
    if (isMatched) {
      return const Color(0xFFEAF5A9);
    }
    if (isSelected) {
      return AppConst.primary;
    }
    if (isDisabled) {
      return const Color(0xFFEAEAEA);
    }
    return AppConst.buttonBackground;
  }

  Color get _borderColor {
    if (isDisabled) {
      return const Color(0xFFD9D9D9);
    }
    return AppConst.primary;
  }

  Color get _foregroundColor {
    if (isDisabled) {
      return const Color(0xFF8D8D8D);
    }
    return AppConst.black;
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(35);

    return Semantics(
      button: true,
      selected: isSelected,
      enabled: _isInteractive,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: height,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: _borderColor),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _isInteractive ? onTap : null,
            borderRadius: borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    SvgPicture.asset(
                      icon!,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        _foregroundColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: (textStyle ?? AppConst.text).copyWith(
                        color: _foregroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
