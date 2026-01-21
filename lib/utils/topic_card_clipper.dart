import 'dart:ui';

import 'package:flutter/material.dart';

class TopicCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 24);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 24);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_) => false;
}
