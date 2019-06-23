import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimatedTweenRotatePage extends StatefulWidget {
  @override
  _AnimatedTweenRotatePageState createState() => _AnimatedTweenRotatePageState();
}

class _AnimatedTweenRotatePageState extends State<AnimatedTweenRotatePage> with SingleTickerProviderStateMixin{

  Animation<double> rotate;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    rotate = Tween<double>(begin: 0,end: Math.pi * 2,).animate(controller)
      ..addListener(() {
        print(Math.pi);
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    rotate.addStatusListener((state) {
      print("$state");
    });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // transform: Matrix4.identity()..rotateZ(rotate.value),
      transform: Matrix4.rotationZ(rotate.value),
      child: FlutterLogo(
        size: 300,
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}