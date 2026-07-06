import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

/// Places an information button at the top-right edge of stacked content.
class InfoButtonStack extends StatelessWidget {
  const InfoButtonStack({
    super.key,
    required this.child,
    required this.onTap,
    this.tooltip,
  });

  /// The widget displayed below the information button.
  final Widget child;

  /// Called when the information button is tapped.
  final VoidCallback onTap;

  /// Optional tooltip for the information button.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -10,
          right: -12,
          child: IconButton(
            tooltip: tooltip,
            onPressed: onTap,
            icon: const Icon(
              Icons.info_outline,
              color: AppConst.black,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
