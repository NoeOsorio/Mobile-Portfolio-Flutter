import 'package:flutter/material.dart';
import 'package:mobile_portfolio/day14/DrawCanvas.dart';

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  getPoints() {}

  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("Borrar"),
        onPressed: () {
          points.clear();
        },
      ),
      body: GestureDetector(
        onPanDown: (details) {
          setState(() {
            final renderBox = context.findRenderObject() as RenderBox;
            final localPosition =
                renderBox.globalToLocal(details.globalPosition);
            points.add(localPosition);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            final renderBox = context.findRenderObject() as RenderBox;
            final localPosition =
                renderBox.globalToLocal(details.globalPosition);
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
        child: Center(
          child: CustomPaint(
            painter: DrawCanvas(points),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
