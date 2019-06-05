import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Container 组件'),
          ),
          body: MyBody()
      ),
    );
  }
}

//body中 会产生业务逻辑 导致很多代码，所以一般都将其分离出来

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text('你好 Flutter 哈哈哈'),
      child: Container(
        child: Text(
          '位于右侧的文本',
          textAlign: TextAlign.right,
          style: TextStyle(backgroundColor: Colors.blueAccent),
        ),
        //容器高
        height: 300.0,
        //容器宽
        width: 300.0,
        //内边距
        padding: EdgeInsets.all(10),
        //装饰
        decoration: BoxDecoration(
          //颜色
          color: Colors.yellow,
          //边框
          border: Border.all(
            // 边框颜色
            color: Colors.blue,
            //边框宽度
            width: 2.0,
          ),
          //边框圆角度
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          ),
          //容器形状 默认矩形
          // shape: BoxShape.circle
          //阴影   可以多色混合
          boxShadow:[
            BoxShadow(
              color: Colors.green,
              blurRadius: 50.0,
            ),
            BoxShadow(
              color: Colors.red,
              blurRadius: 50.0,
            ),
          ],
          gradient: LinearGradient(colors: [Colors.red,Colors.blue]),
        ),

      ),
    );
  }
}
