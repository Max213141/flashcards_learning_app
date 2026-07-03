import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color indicatorColor;
  final Widget accomplishment;
  final double progress;
  const CircularProgressBar({
    super.key,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white,
    required this.indicatorColor,
    required this.accomplishment,
    this.progress = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: progress == 0
              ? Center(child: accomplishment)
              : Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 4,
                      strokeCap: StrokeCap.round,

                      color: indicatorColor,
                    ),
                    accomplishment,
                  ],
                ),
        ),
      ),
    );
  }
}
