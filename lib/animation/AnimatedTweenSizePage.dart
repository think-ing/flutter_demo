import 'package:flutter/material.dart';

class AnimatedTweenSizePage extends StatefulWidget {
  @override
  _AnimatedTweenSizePageState createState() => _AnimatedTweenSizePageState();
}

class _AnimatedTweenSizePageState extends State<AnimatedTweenSizePage> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    animation.addStatusListener((state){
      print("$state");
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}