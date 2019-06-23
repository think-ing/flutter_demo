import 'package:flutter/material.dart';

class AnimatedTweenRadiusPage extends StatefulWidget {
  @override
  _AnimatedTweenRadiusPageState createState() => _AnimatedTweenRadiusPageState();
}

class _AnimatedTweenRadiusPageState extends State<AnimatedTweenRadiusPage> with SingleTickerProviderStateMixin{

  Animation<BorderRadius> radius;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    radius = Tween<BorderRadius>(begin: BorderRadius.circular(0.0),end: BorderRadius.circular(150.0),).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    radius.addStatusListener((state) {
      print("$state");
    });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.blue,
        border: new Border.all(
          //黑色 3像素边框
          color: Colors.black,
          width: 3.0,
        ),
        borderRadius: radius.value,
      ),
      child: FlutterLogo(
        size: 300,
        colors: Colors.red,
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}