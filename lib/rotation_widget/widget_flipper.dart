import 'dart:math';

import 'package:flashcards_learning_app/rotation_widget/animated_card.dart';
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

  void _updateRotations(bool isRightTap) {
    setState(() {
      bool rotateToLeft =
          (isFrontVisible && !isRightTap) || !isFrontVisible && isRightTap;
      _frontRotation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(
            begin: 0.0,
            end: rotateToLeft ? (pi / 2) : (-pi / 2),
          ).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)),
          weight: 50.0,
        ),
      ]).animate(controller);
      _backRotation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(
            begin: rotateToLeft ? (-pi / 2) : (pi / 2),
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

  void _leftRotation() {
    _toggleSide(false);
  }

  void _rightRotation() {
    _toggleSide(true);
  }

  void _toggleSide(bool isRightTap) {
    _updateRotations(isRightTap);
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .5,
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
          onTap: _leftRotation,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(color: Colors.transparent),
          ),
        ),
        GestureDetector(
          onTap: _rightRotation,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
