import 'package:flutter/material.dart';

import 'navigator_b/HomePage.dart';
import 'navigator_b/OnePage.dart';
import 'navigator_b/TowPage.dart';
import 'navigator_b/ThreePage.dart';
import 'navigator_b/PageA.dart';
import 'navigator_b/PageB.dart';
import 'navigator_b/PageC.dart';
/*

返回到首页有两种方式
1、//替换路由     替换当前页为目标页（也就是说，堆栈中只有首页和当前页  两个页面，当前页返回自然是首页）
    Navigator.of(context).pushReplacementNamed('/towPage');

2、清除所有路由 跳转路由（此方法可以跳转任意页面）
Navigator.of(context).pushAndRemoveUntil(
  new MaterialPageRoute(builder: (context) => new HomePage()),
   (route) => route == null
);

*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //配置路由页面参数
  final routes = {
    '/':(context) => HomePage(),
    '/onePage':(context) => OnePage(),
    '/towPage':(context) => TowPage(),
    '/threePage':(context) => ThreePage(),

    '/pageA':(context) => PageA(),
    '/pageB':(context) => PageB(),
    '/pageC':(context) => PageC(),

  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //初始化 加载页
      initialRoute: '/',
      //配置路由监听
      onGenerateRoute: (RouteSettings settings) {
        // 统一处理
        final String name = settings.name;
        final Function pageContentBuilder = this.routes[name];
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context,
                    arguments: settings.arguments));
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
    );
  }
}