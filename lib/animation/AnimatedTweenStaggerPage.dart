import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimatedTweenStaggerPage extends StatefulWidget {
  @override
  _AnimatedTweenStaggerPageState createState() => _AnimatedTweenStaggerPageState();
}

class _AnimatedTweenStaggerPageState extends State<AnimatedTweenStaggerPage> with SingleTickerProviderStateMixin{

  //动画控制器
  AnimationController controller;
  //透明度渐变
  Animation<double> opacity;
  //翻转
  Animation<double> rotate;
  //位移
  Animation<EdgeInsets> movement;
  //高宽渐变
  Animation<double> width;
  Animation<double> height;
  //方形变圆
  Animation<BorderRadius> radius;
  //颜色渐变
  Animation<Color> color;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 6), vsync: this);
    // 以下 写法  所有动画同时 进行
    // opacity = Tween<double>(begin: 0.0,end: 1.0,).animate(controller);
    // rotate = Tween<double>(begin: 0,end: Math.pi * 2,).animate(controller);
    // movement = Tween<EdgeInsets>(begin: EdgeInsets.only(top: 0.0), end: EdgeInsets.only(top: 300.0),).animate(controller );
    // radius = Tween<BorderRadius>(begin: BorderRadius.circular(0.0),end: BorderRadius.circular(150.0),).animate(controller);
    // color = ColorTween(begin: Colors.blue,end: Colors.red,).animate(controller);
    // width = Tween(begin: 0.0, end: 300.0).animate(controller );
    // height = Tween(begin: 0.0, end: 300.0).animate(controller );

    // 为动画添加延迟 写法
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.easeIn,
        ),
      ),
    );

    rotate = Tween<double>(
      begin: 0.0,
      end: Math.pi * 2,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.ease,
        ),
      ),
    );

    movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0),
      end: EdgeInsets.only(top: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          0.375,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    radius = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(150.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.linear,
        ),
      ),
    );

    height = Tween<double>(
      begin: 100.0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    width = Tween<double>(
      begin: 100.0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    controller.forward();
  }


  // 组合以上动画
  Widget _buildAni(BuildContext context, Widget child) {
    return new Container(
      //位移
      padding: movement.value,
      //翻转
      transform: Matrix4.identity()..rotateZ(rotate.value),
      child: new Opacity(//透明度渐变
        opacity: opacity.value,
        child: new Container(
            width: width.value,
            height: height.value,
            decoration: new BoxDecoration(
              color: color.value,
              border: new Border.all(
                //黑色 3像素边框
                color: Colors.black,
                width: 3.0,
              ),
              borderRadius: radius.value,
            ),
            child: FlutterLogo()
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAni);
  }
}