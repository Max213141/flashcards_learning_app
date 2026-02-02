import 'package:flutter/material.dart';

class SwTicketBorder extends ShapeBorder {
  final Color? fillColor;
  final double borderWidth;

  const SwTicketBorder({this.fillColor, required this.borderWidth});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderWidth);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect, textDirection: textDirection), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _createPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (fillColor != null) {
      final fillPaint = Paint()
        ..color =
            fillColor! // Use the provided fillColor
        ..style = PaintingStyle.fill;
      final fillPath = getInnerPath(rect, textDirection: textDirection);
      canvas.drawPath(fillPath, fillPaint);
    }
  }

  Path _createPath(Rect rect) {
    // Inset the rect by the pathWidth so the border is inside the rect.
    Rect insetRect = rect.deflate(borderWidth);

    // The path for the 'ticket' shape
    Path path = Path();

    // Move to the start point
    path.moveTo(insetRect.right * .8, insetRect.top);

    path.lineTo(insetRect.right * .8, insetRect.bottom * .4);
    path.lineTo(insetRect.right, insetRect.bottom * .4);

    path.lineTo(insetRect.right, insetRect.bottom);
    path.lineTo(insetRect.left, insetRect.bottom);
    path.lineTo(insetRect.left, insetRect.top);

    path.close();

    return path;
  }

  @override
  ShapeBorder scale(double t) {
    return SwTicketBorder(borderWidth: borderWidth * t);
  }
}
