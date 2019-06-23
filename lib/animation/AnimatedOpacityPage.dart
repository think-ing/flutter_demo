import 'package:flutter/material.dart';

///动画不透明度  可完成 淡入和淡出小部件

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedOpacity Demo'),),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0,-0.9),
            child: Text('使用不透明度动画完成淡入淡出元素流畅的动画体验',style: TextStyle(fontSize: 20),),
          ),
          Align(
            alignment: Alignment(0,0),
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _visible ? 1.0 : 0.0,
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flip),
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
    );
  }
}