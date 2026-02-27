import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class SortButtonSecondPart extends StatelessWidget {
  final bool isExpanded;
  const SortButtonSecondPart({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppConst.primary, width: 2),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomFlipingIcon(isExpanded: isExpanded),
          ),
        ),
      ),
    );
  }
}
