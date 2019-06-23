import 'package:flutter/material.dart';

class AnimatedTweenOpacityPage extends StatefulWidget {
  @override
  _AnimatedTweenOpacityPageState createState() =>
      _AnimatedTweenOpacityPageState();
}

class _AnimatedTweenOpacityPageState extends State<AnimatedTweenOpacityPage> with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    opacity = Tween<double>(begin: 0.0,end: 1.0,).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    opacity.addStatusListener((state) {
      print("$state");
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity.value,
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
