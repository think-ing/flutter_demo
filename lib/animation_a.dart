import 'package:flutter/material.dart';
import 'animation/AnimatedContainerPage.dart';
import 'animation/AnimatedOpacityPage.dart';
import 'animation/AnimatedAlignPage.dart';
import 'animation/AnimatedTweensPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/AnimatedContainerPage' : (context) => AnimatedContainerPage(),
        '/AnimatedOpacityPage' : (context) => AnimatedOpacityPage(),
        '/AnimatedAlignPage' : (context) => AnimatedAlignPage(),
        '/AnimatedTweensPage' : (context) => AnimatedTweensPage(),
      },
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter animation 动画'),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[

          RaisedButton(
              child: Text('Animated Container'),
              onPressed: () => Navigator.pushNamed(context, '/AnimatedContainerPage')
          ),

          RaisedButton(
              child: Text('Animated Opacity'),
              onPressed: () => Navigator.pushNamed(context, '/AnimatedOpacityPage')
          ),

          RaisedButton(
              child: Text('Animated Align'),
              onPressed: () => Navigator.pushNamed(context, '/AnimatedAlignPage')
          ),
          RaisedButton(
              child: Text('Tween动画集合'),
              onPressed: () => Navigator.pushNamed(context, '/AnimatedTweensPage')
          ),


        ],
      ),
    );
  }
}