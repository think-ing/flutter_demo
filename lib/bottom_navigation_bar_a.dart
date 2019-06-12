import 'package:flutter/material.dart';
import 'home/MyHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      // home: MyHomeTo(),
    );
  }
}

//简单的应用
class MyHomeTo extends StatefulWidget {
  @override
  _MyHomeToState createState() => _MyHomeToState();
}

class _MyHomeToState extends State<MyHomeTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter BottomNavigationBar 组件'),),
      body: Container(
        alignment: Alignment.center,
        child: Text('Flutter BottomNavigationBar 组件 应用'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('分类')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('设置')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的')
          ),
        ],
      ),
    );
  }
}