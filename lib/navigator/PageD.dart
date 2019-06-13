import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  //定义变量
  final arguments;
  //重写构造  接收数据
  PageD({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter PageD'),),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('返回'),
                onPressed: () {Navigator.pop(context);},
              ),
              SizedBox(
                height: 50,
              ),
              Text('接收到数据为：${arguments != null ? arguments['id'] : '无'}'),
            ],
          ),
        )
    );
  }
}