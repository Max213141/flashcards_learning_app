import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = AppConst.black;
    Path path = Path();

    // Path number 1

    paint.color = AppConst.lavender;
    path = Path();
    // print(size.width);
    // print(size.height);

    path.moveTo(size.width * 0.2, size.height * 0.01);
    path.cubicTo(
      size.width * 0.2, //x1
      size.height * 0.01, //y1
      size.width * 0.1, //x2
      size.height * 0.01, //y2
      size.width * 0.1, //x3
      size.height * 0.01, //y3
    );
    path.cubicTo(
      size.width * 0.01, //x1
      size.height * 0.01, //y1
      0, //x2
      size.height * 0.1, //y2
      0, //x3
      size.height * 0.19, //y3
    );
    path.cubicTo(
      0,
      size.height * 0.19,
      0,
      size.height * 0.9,
      0,
      size.height * 0.85,
    );

    path.quadraticBezierTo(
      size.width * 0.001,
      size.height,

      size.width * 0.09,
      size.height,
    );
    path.cubicTo(
      size.width * 0.09,
      size.height,
      size.width * 0.94,
      size.height,
      size.width * 0.94,
      size.height,
    );
    path.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height * 0.93,
      size.width,
      size.height * 0.9,
    );
    path.cubicTo(
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.19,
      size.width,
      size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.01,

      size.width * 0.91,
      size.height * 0.01,
    );
    path.cubicTo(
      size.width * 0.8,
      size.height * 0.01,
      size.width * 0.78,
      size.height * 0.01,
      size.width * 0.76,
      size.height * 0.01,
    );
    path.quadraticBezierTo(
      size.width * 0.73,
      size.height * 0.01,
      size.width * 0.71,
      size.height * 0.046,
    );
    path.lineTo(size.width * 0.685, size.height * 0.1);
    path.quadraticBezierTo(
      size.width * 0.67,
      size.height * 0.125,
      size.width * 0.63,
      size.height * 0.12,
    );
    path.lineTo(size.width * 0.35, size.height * 0.12);
    path.quadraticBezierTo(
      size.width * 0.315,
      size.height * 0.125,
      size.width * 0.295,
      size.height * 0.09,
    );
    path.lineTo(size.width * 0.265, size.height * 0.046);
    path.quadraticBezierTo(
      size.width * 0.235,
      size.height * 0.001,
      size.width * 0.2,
      size.height * 0.01,
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
