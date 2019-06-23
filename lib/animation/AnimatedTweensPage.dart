import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AnimatedTweenSizePage.dart';
import 'AnimatedTweenOpacityPage.dart';
import 'AnimatedTweenRotatePage.dart';
import 'AnimatedTweenMovementPage.dart';
import 'AnimatedTweenRadiusPage.dart';
import 'AnimatedTweenColorPage.dart';
import 'AnimatedTweenStaggerPage.dart';

class AnimatedTweensPage extends StatefulWidget {
  @override
  _AnimatedTweensPageState createState() => _AnimatedTweensPageState();
}

class _AnimatedTweensPageState extends State<AnimatedTweensPage> {

  Widget myBody = FlutterLogo(size: 300,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Tween 动画'),),
      body: Column(

        children: <Widget>[
          Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                child: Text('缩放'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenSizePage();
                  });
                },
              ),
              RaisedButton(
                child: Text('淡入淡出'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenOpacityPage();
                  });
                },
              ),
              RaisedButton(
                child: Text('旋转'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenRotatePage();
                  });
                },
              ),
              RaisedButton(
                child: Text('位移'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenMovementPage();
                  });
                },
              ),
              RaisedButton(
                child: Text('方变圆'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenRadiusPage();
                  });
                },
              ),
              RaisedButton(
                child: Text('颜色渐变'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenColorPage();
                  });
                },
              ),
              RaisedButton(
                child: Text('组合动画'),
                onPressed: () {
                  setState(() {
                    myBody = AnimatedTweenStaggerPage();
                  });
                },
              ),





            ],
          ),
          Expanded(
            child: Center(
              child: myBody,
            ),
          ),
          // AnimatedTweenOpacityPage()
        ],
      ),
    );
  }
}