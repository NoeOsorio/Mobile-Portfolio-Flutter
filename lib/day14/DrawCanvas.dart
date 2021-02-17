import 'dart:ui';

import 'package:flutter/material.dart';

class DrawCanvas extends CustomPainter {
  final List<Offset> offsets;

  DrawCanvas(this.offsets) : super();

  bool shouldDrawPoint(int i) =>
      offsets[i] != null && offsets.length > i + 1 && offsets[i + 1] == null;

  bool shouldDrawLine(int i) =>
      offsets[i] != null && offsets.length > i + 1 && offsets[i + 1] != null;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    for (var i = 0; i < offsets.length; i++) {
      try {
        if (shouldDrawLine(i)) {
          canvas.drawLine(offsets[i], offsets[i + 1], paint);
        } else if (shouldDrawPoint(i)) {
          canvas.drawPoints(PointMode.points, [offsets[i]], paint);
        }
      } catch (e) {}
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
