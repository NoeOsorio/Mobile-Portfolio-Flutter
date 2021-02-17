import 'package:flutter/material.dart';
import 'package:mobile_portfolio/day14/DrawCanvas.dart';

class Lienzo extends StatefulWidget {
  Lienzo({Key key}) : super(key: key);
  @override
  LienzoState createState() => LienzoState();
}

class LienzoState extends State<Lienzo> {
  List<Offset> points = [];

  void clear() {
    setState(() {
      points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        setState(() {
          final renderBox = context.findRenderObject() as RenderBox;
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          points.add(localPosition);
        });
      },
      onPanUpdate: (details) {
        setState(() {
          final renderBox = context.findRenderObject() as RenderBox;
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          points.add(localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          if (points.last != null) {
            points.add(null);
          }
        });
      },
      child: Container(
        color: Colors.transparent,
        child: CustomPaint(
          painter: DrawCanvas(points),
          child: Container(),
        ),
      ),
    );
  }
}
