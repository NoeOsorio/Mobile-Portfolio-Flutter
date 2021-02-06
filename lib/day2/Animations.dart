import 'package:flutter/material.dart';
import 'package:mobile_portfolio/day2/Canvas.dart';
import 'dart:math' as math;

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: -math.pi, end: math.pi).animate(controller)
      ..addListener(() {
        print(animation.value);
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.repeat();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
    // controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: Canva(
              sides: (animation.value.floor().abs()) + 3,
              radius: 100,
              radians: animation.value),
          child: Container(),
        ),
        // child: Container(
        //   decoration: BoxDecoration(
        //       color: Colors.black12,
        //       borderRadius: BorderRadius.circular(animation.value)),
        //   width: animation.value,
        //   height: animation.value,
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
