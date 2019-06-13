import 'package:flutter/material.dart';
import 'navigator/PageA.dart';
import 'navigator/PageB.dart';
import 'navigator/PageC.dart';
import 'navigator/PageD.dart';

//页面跳转  Demo
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //配置路由页面参数
  final routes = {
    '/pageC':(context) => PageC(),
    '/pageD':(context,{arguments})=>PageD(arguments:arguments),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Flutter 页面跳转'),),
          body: MyBody()
      ),
      // 静态路由 配置
      // routes: {
      //   '/pageC':(context) => PageC(),
      //   '/pageD':(context) => PageD(),
      // },
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

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

//---------------------------------------------------------A--------------------
          Text('基本路由（静态路由），不传递数据'),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('跳转A'),
            onPressed: () {
              //路由跳转
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PageA()));
            },
          ),

//---------------------------------------------------------B--------------------
          SizedBox(
            height: 50,
          ),
          Text('基本路由（静态路由），传递数据'),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('跳转B'),
            onPressed: () {
              //路由跳转  并 传值
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PageB(para: '你好，我是来自main页面得数据',)));
            },
          ),

//---------------------------------------------------------C--------------------
          SizedBox(
            height: 50,
          ),
          Text('命名路由（动态路由），不传递数据'),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('跳转C'),
            onPressed: () {
              //路由跳转
              Navigator.pushNamed(context, '/pageC');
            },
          ),

//---------------------------------------------------------D--------------------
          SizedBox(
            height: 50,
          ),
          Text('命名路由（动态路由），传递数据'),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('跳转D'),
            onPressed: () {
              //路由跳转  参数名必须是 arguments map类型   传递id  等于123456
              Navigator.pushNamed(context, '/pageD',arguments:{"id":123456});
            },
          ),

        ],
      ),
    );
  }
}
