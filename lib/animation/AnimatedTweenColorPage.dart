import 'package:flutter/material.dart';

class AnimatedTweenColorPage extends StatefulWidget {
  @override
  _AnimatedTweenColorPageState createState() => _AnimatedTweenColorPageState();
}

class _AnimatedTweenColorPageState extends State<AnimatedTweenColorPage> with SingleTickerProviderStateMixin{

  Animation<Color> color;

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    color = ColorTween(begin: Colors.blue,end: Colors.red,).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    color.addStatusListener((state) {
      print("$state");
    });

    controller.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: color.value,
        border: new Border.all(
          //黑色 3像素边框
          color: Colors.black,
          width: 3.0,
        ),
      ),
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