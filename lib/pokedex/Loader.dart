import 'package:flutter/material.dart';
import 'dart:math' as math;

class PokeLoader extends StatefulWidget {
  @override
  _PokeLoaderState createState() => _PokeLoaderState();
}

class _PokeLoaderState extends State<PokeLoader>
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
  void dispose() {
    controller.dispose();
    print("Dispose Loader");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: Container(
        width: 100,
        height: 100,
        child: Image.asset(
          "assets/images/pokeball.png",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
