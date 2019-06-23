import 'dart:math';

import 'package:flutter/material.dart';

///使容器的属性具有动画效果

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer Demo'),),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0,-0.9),
            child: Text('一个Container 类提供的方法，具有特定属性的插件：宽度，高度，背景颜色，填充，边框，以及更多的动画。',style: TextStyle(fontSize: 20),),
          ),
          Align(
            alignment: Alignment(0,0),
            child: AnimatedContainer(
              // 定义动画需要多长时间
              duration: Duration(seconds:1),
              // 提供一个可选的曲线，使动画感觉更流畅。
              curve: Curves.fastOutSlowIn,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          // 使用setState用新值重建小部件。
          setState(() {
            // 创建一个随机数生成器
            final random = Random();

            // 生成一个随机的宽度和高度
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // 生成随机颜色
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // 生成一个随机边界半径
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),

    );
  }
}