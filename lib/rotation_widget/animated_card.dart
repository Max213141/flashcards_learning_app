import 'package:flutter/material.dart';

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const AnimatedCard({super.key, required this.child, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
