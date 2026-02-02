import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingFab extends StatefulWidget {
  final VoidCallback? onPressed;

  const RotatingFab({super.key, this.onPressed});

  @override
  State<RotatingFab> createState() => _RotatingFabState();
}

class _RotatingFabState extends State<RotatingFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void _handleTap() {
    if (_isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    setState(() => _isOpen = !_isOpen);
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
          onPressed: _handleTap,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * (math.pi / 4),
                child: child,
              );
            },
            child: const Icon(Icons.add, size: 28),
          ),
        ),
      ),
    );
  }
}
