import 'package:flutter/material.dart';

class AnimatedTweenMovementPage extends StatefulWidget {
  @override
  _AnimatedTweenMovementPageState createState() => _AnimatedTweenMovementPageState();
}

class _AnimatedTweenMovementPageState extends State<AnimatedTweenMovementPage> with SingleTickerProviderStateMixin{

  Animation<EdgeInsets> movement;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    movement = Tween<EdgeInsets>(begin: EdgeInsets.only(top: 0.0), end: EdgeInsets.only(top: 300.0),).animate(curve)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    movement.addStatusListener((state) {
      print("$state");
    });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: movement.value,
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