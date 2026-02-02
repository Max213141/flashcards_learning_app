import 'dart:math';

import 'package:flashcards_learning_app/utils/rotation_widget/animated_card.dart';
import 'package:flashcards_learning_app/utils/shaped_decorated_box.dart';
import 'package:flutter/material.dart';

class WidgetFlipper extends StatefulWidget {
  final Widget frontWidget;
  final Widget backWidget;
  const WidgetFlipper({
    super.key,
    required this.frontWidget,
    required this.backWidget,
  });

  @override
  State<WidgetFlipper> createState() => _WidgetFlipperState();
}

class _WidgetFlipperState extends State<WidgetFlipper>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool isFrontVisible = true;

  // Source - https://stackoverflow.com/a
  // Posted by Pablo Barrera, modified by community. See post 'Timeline' for change history
  // Retrieved 2026-01-13, License - CC BY-SA 4.0

  void _updateRotations(bool isTopTap) {
    setState(() {
      bool rotateDown =
          (isFrontVisible && !isTopTap) || !isFrontVisible && isTopTap;
      _frontRotation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(
            begin: 0.0,
            end: rotateDown ? (pi / 2) : (-pi / 2),
          ).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateDown ? (-pi / 2) : (pi / 2)),
          weight: 50.0,
        ),
      ]).animate(controller);
      _backRotation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateDown ? (pi / 2) : (-pi / 2)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(
            begin: rotateDown ? (-pi / 2) : (pi / 2),
            end: 0.0,
          ).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ]).animate(controller);
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _updateRotations(true);
  }

  void _topRotation() {
    _toggleSide(false);
  }

  void _bottomRotation() {
    _toggleSide(true);
  }

  void _toggleSide(bool isTopTap) {
    _updateRotations(isTopTap);
    if (isFrontVisible) {
      controller.forward();
      isFrontVisible = false;
    } else {
      controller.reverse();
      isFrontVisible = true;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: 355, height: 475),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedCard(animation: _backRotation, child: widget.backWidget),
          AnimatedCard(animation: _frontRotation, child: widget.frontWidget),
          _tapDetectionControls(),
        ],
      ),
    );
  }

  Widget _tapDetectionControls() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _topRotation,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 0.5,
            alignment: Alignment.bottomCenter,
            child: Container(color: const Color.fromARGB(0, 255, 255, 255)),
          ),
        ),
        GestureDetector(
          onTap: _bottomRotation,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 0.5,
            alignment: Alignment.topCenter,
            child: DecoratedBox(
              decoration: const ShapeDecoration(
                shape: SwTicketBorder(
                  fillColor: Colors.transparent,
                  borderWidth: 4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
