import 'package:flutter/material.dart';
import 'dart:math' as math;

class Canva extends CustomPainter {
  Canva({@required this.sides, @required this.radius, @required this.radians});

  int sides;
  double radius;
  double radians;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    // DETERMINING THE PATH TO BE DRAWN

    var path = Path();
    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);

// startPoint => (100.0, 0.0)
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawPath(path, paint);
    // // rotate the canvas
    // final degrees = 15;
    // final radians = degrees * math.pi / 180;
    canvas.rotate(radians);

    // // draw the text
    // final textStyle = TextStyle(color: Colors.black, fontSize: 30);
    // final textSpan = TextSpan(text: 'Hello, world.', style: textStyle);
    // TextPainter(text: textSpan, textDirection: TextDirection.ltr)
    //   ..layout(minWidth: 0, maxWidth: size.width)
    //   ..paint(canvas, Offset(0, 0));

    // canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
