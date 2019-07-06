import 'package:flutter/material.dart';
import 'dialog/AboutDialogDemo.dart';
import 'dialog/AlertDialogDemo.dart';
import 'dialog/CupertinoAlertDialogDemo.dart';
import 'dialog/SimpleDialogDemo.dart';
import 'dialog/CupertinoFullscreenDialogTransitionDemo.dart';

void main() {
  runApp(MaterialApp(
    home: HmoePage(),
  ));
}

class HmoePage extends StatefulWidget {
  @override
  _HmoePageState createState() => _HmoePageState();
}

class _HmoePageState extends State<HmoePage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0.0,end: 1.0,).animate(controller);
    animation.addListener(() {
      setState(() {
        // the state that has changed here is the animation object’s value
      });
    });
    animation.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   controller.reverse();
      // } else if (status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
    // controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dialog Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('AlertDialog'),
              onPressed: () {
                mAlertDialog(context);
              },
            ),
            RaisedButton(
              child: Text('AboutDialog'),
              onPressed: () {
                mAboutDialog(context);
              },
            ),
            RaisedButton(
              child: Text('SimpleDialog'),
              onPressed: () {
                mSimpleDialog(context);
              },
            ),
            RaisedButton(
              child: Text('CupertinoAlertDialog'),
              onPressed: () {
                mCupertinoAlertDialog(context);
              },
            ),
            RaisedButton(
              child: Text('CupertinoFullscreenDialogTransition'),
              onPressed: () {
                bool b1 = controller.isAnimating;
                bool b2 = controller.isCompleted;
                bool b3 = controller.isDismissed;

                mCupertinoFullscreenDialogTransition(context, animation);
                if (b1 || b2) {
                  controller.forward(from: 0.0);
                }
                if (b3) {
                  controller.forward();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}