import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortOptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SortOptionTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                isSelected
                    ? 'assets/iconss/radio_button_checked.svg'
                    : 'assets/iconss/radio_button.svg',
                width: 18,
                color: AppConst.black,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppConst.text.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : AppConst.text.fontWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
