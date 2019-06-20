import 'package:flutter/material.dart';
import 'appBarTabPages/TabPageA.dart';
import 'appBarTabPages/TabPageB.dart';
import 'appBarTabPages/TabPageC.dart';
import 'appBarTabPages/TabControllerPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialAppA();
    // return MaterialAppB();
    // return MaterialAppC();
    // return MeituanFaxianAppBar();
    return TabControllerPage();
  }
}

//去掉头部的appBar(其实就是将TabBar组件放在了title中)
class MaterialAppC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        //指定tabbar个数
        length: 3,
        initialIndex:0,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: <Widget>[
                Tab(text: 'PageA',),
                Tab(text: 'PageB',),
                Tab(text: 'PageC',),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TabPageA(),
              TabPageB(),
              TabPageC(),
            ],
          ),
        ),
      ),
    );
  }
}

//appBar中Bottom使用方法
class MaterialAppB extends StatefulWidget {
  @override
  _MaterialAppBState createState() => _MaterialAppBState();
}

class _MaterialAppBState extends State<MaterialAppB> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        //指定tabbar个数
        length: 3,
        initialIndex:0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter AppBar 组件'),

            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'PageA',),
                Tab(text: 'PageB',),
                Tab(text: 'PageC',),
              ],
            ),
          ),

          body: TabBarView(
            children: <Widget>[
              TabPageA(),
              TabPageB(),
              TabPageC(),
            ],
          ),
        ),
      ),
    );
  }
}

//appBar的基本用法
class MaterialAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去掉debug标签
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter AppBar 组件'),
          //标题不居中
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('我是leading按钮');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_a_photo),
              onPressed: () {
                print('我是右3按钮');
              },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                print('我是右2按钮');
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                print('我是右1按钮');
              },
            ),
          ],
        ),
      ),
    );
  }
}
