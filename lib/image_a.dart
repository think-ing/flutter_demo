import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Image 组件'),),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //设置容器大小
        width: 320.0,
        height: 203.0,
        decoration: BoxDecoration(
          //背景色
            color: Colors.yellow
        ),
        /*
        加载资源图片
        child: Image.asset('images/aa.jpg'),
        */

        /*
        加载网络图片
        child: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/ba.jpg',),
         */

        /*
        图片混合蓝色
        child: Image.network(
          'https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/ba.jpg',
          color: Colors.blue,
          colorBlendMode: BlendMode.colorDodge,
        ),
        */

        /*
        图片平铺
        child: Image.network(
          'https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/bc.jpg',
          repeat: ImageRepeat.repeat,
        ),
        */

        /*
        设定拉伸部位
        child: Image.network(
          'https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/bc.jpg',
          centerSlice:Rect.fromLTRB(10, 11, 12, 13),
        ),
        */

      ),
    );
  }
}