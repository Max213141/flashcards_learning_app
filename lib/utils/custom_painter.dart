import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..color = Colors.blue;
    Path path = Path();

    // Path number 1

    paint.color = Colors.red;
    path = Path();
    print(size.width);
    print(size.height);

    path.moveTo(size.width * 0.14, size.height * 0.11);
    path.cubicTo(
      size.width * 0.14, //x1
      size.height * 0.11, //y1
      size.width * 0.05, //x2
      size.height * 0.11, //y2
      size.width * 0.05, //x3
      size.height * 0.11, //y3
    );
    path.cubicTo(
      size.width * 0.01, //x1
      size.height * 0.11, //y1
      0, //x2
      size.height * 0.16, //y2
      0, //x3
      size.height * 0.19, //y3
    );
    // path.cubicTo(
    //   0,
    //   size.height * 0.19,
    //   0,
    //   size.height * 0.9,
    //   0,
    //   size.height * 0.9,
    // );
    // path.cubicTo(
    //   0,
    //   size.height,
    //   size.width * 0.04,
    //   size.height,
    //   size.width * 0.06,
    //   size.height,
    // );
    // path.cubicTo(
    //   size.width * 0.06,
    //   size.height,
    //   size.width * 0.94,
    //   size.height,
    //   size.width * 0.94,
    //   size.height,
    // );
    // path.cubicTo(
    //   size.width,
    //   size.height,
    //   size.width,
    //   size.height * 0.93,
    //   size.width,
    //   size.height * 0.9,
    // );
    // path.cubicTo(
    //   size.width,
    //   size.height * 0.9,
    //   size.width,
    //   size.height * 0.19,
    //   size.width,
    //   size.height * 0.19,
    // );
    // path.cubicTo(
    //   size.width,
    //   size.height * 0.11,
    //   size.width * 0.96,
    //   size.height * 0.1,
    //   size.width * 0.94,
    //   size.height * 0.11,
    // );
    // path.cubicTo(
    //   size.width * 0.94,
    //   size.height * 0.11,
    //   size.width * 0.27,
    //   size.height * 0.11,
    //   size.width * 0.27,
    //   size.height * 0.11,
    // );
    // path.cubicTo(
    //   size.width * 0.27,
    //   size.height * 0.11,
    //   size.width / 5,
    //   0,
    //   size.width / 5,
    //   0,
    // );
    // path.cubicTo(
    //   size.width / 5,
    //   0,
    //   size.width * 0.14,
    //   size.height * 0.11,
    //   size.width * 0.14,
    //   size.height * 0.11,
    // );
    // path.cubicTo(
    //   size.width * 0.14,
    //   size.height * 0.11,
    //   size.width * 0.14,
    //   size.height * 0.11,
    //   size.width * 0.14,
    //   size.height * 0.11,
    // );
    canvas.drawPath(path, paint);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
