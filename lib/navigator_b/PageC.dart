import 'package:flutter/material.dart';

import 'HomePage.dart';
//import '/HomePage.dart';

class PageC extends StatefulWidget {
  @override
  _PageCState createState() => _PageCState();
}

class _PageCState extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('返回'),
          onPressed: () {
            /// 清除所有路由 跳转路由（此方法可以跳转任意页面）  看你过我 《Flutter 页面跳转》 文章的你会发现，
            /// 下边语句和静态鲁豫非常相似
            Navigator.of(context).pushAndRemoveUntil(
              //跳转
                new MaterialPageRoute(builder: (context) => new HomePage()),
                //清除其他路由
                    (route) => route == null
            );
          },
        ),
      ),
    );
  }
}