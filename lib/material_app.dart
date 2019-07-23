import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    // home: Text('data'),
      home: Scaffold(appBar: AppBar(title: Text('Flutter MaterialApp'),),),

      // 跳转页面配置
      routes: <String, WidgetBuilder>{
        'a':(BuildContext context){
          //new aPage();
        },
      } ,

      //初始路由，/ 为根路由，没有home时启动
      initialRoute: '/',

      //生成路由 home和initialRoute都未指定时启动
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => Text('生成了路由'),
        );
      },

      //未知路由 home、initialRoute、onGenerateRoute都未指定时启动
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Text('路由找不到了')
  ),

    // 导航观察者
    navigatorObservers : <NavigatorObserver>[MyNavigatorObserver()],

    //这个是直接渲染这个builder，不会走路由，优先渲染这个里面的widget
    builder: (BuildContext context, Widget w) => Text("builder生成新的view"),

    //任务管理器 名称
    title: 'MaterialApp属性说明',

    //新的title
    onGenerateTitle: (BuildContext context){return '新的说明';},

    //任务管理器的标题背景颜色
    color: Colors.yellow,

    //主题
    theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light
    ),

    //暗主题
    darkTheme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark
    ),
    // locale: ,
    // localizationsDelegates: ,
    // localeListResolutionCallback: ,
    // localeResolutionCallback: ,
    supportedLocales :  <Locale>[
      const Locale('en', 'US'),
      const Locale('fi', 'FI'),
    ],
    // debugShowMaterialGrid: false,
    // showPerformanceOverlay: false: ,
    // checkerboardRasterCacheImages: false,
    // checkerboardOffscreenLayers: false,
    // showSemanticsDebugger: false,
    // debugShowCheckedModeBanner: true,
  ));
}






class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    print(route.settings);
    print(previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // 当调用Navigator.pop时回调
    super.didPop(route, previousRoute);
    print(route);
    //route.currentResult获取返回内容
    print(previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // 当调用Navigator.Remove时回调
    super.didRemove(route, previousRoute);
    print(route);
    print(previousRoute);
  }
}