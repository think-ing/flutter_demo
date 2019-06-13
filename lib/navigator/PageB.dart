import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  //定义变量
  var para;
  //重写构造  接收数据
  PageB({this.para = '没有接收到数据'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter PageB'),),
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
              Text(this.para),
            ],
          ),
        )
    );
  }
}