import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  double _x = -1;
  double _y = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign demo'),),
      body: AnimatedAlign(
        alignment: Alignment(_x,_y),
        duration: Duration(seconds: 1),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          // 使用setState用新值重建小部件。
          setState(() {
            // // 创建一个随机数生成器
            final random = Random();

            // 生成一个随机的宽度和高度
            _x = ((random.nextInt(200) - 100) / 100).toDouble();
            _y = ((random.nextInt(200) - 100) / 100).toDouble();

          });
        },
      ),

    );
  }
}