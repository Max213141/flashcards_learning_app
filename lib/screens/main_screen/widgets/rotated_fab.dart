import 'dart:math' as math;
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RotatingFab extends StatefulWidget {
  final bool isOpen;
  final VoidCallback? onPressed;

  const RotatingFab({super.key, required this.isOpen, this.onPressed});

  @override
  State<RotatingFab> createState() => _RotatingFabState();
}

class _RotatingFabState extends State<RotatingFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: widget.isOpen ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant RotatingFab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isOpen == widget.isOpen) {
      return;
    }

    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _handleTap() {
    widget.onPressed?.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          heroTag: null,
          elevation: 0,
          backgroundColor: AppConst.primary,
          shape: const CircleBorder(),
          onPressed: _handleTap,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * (math.pi / 4),
                child: child,
              );
            },
            child: SvgPicture.asset(
              'assets/iconss/plus.svg',
              width: 30,
              colorFilter: const ColorFilter.mode(
                AppConst.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
