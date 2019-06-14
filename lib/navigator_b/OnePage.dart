

import 'package:flutter/material.dart';


class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('下一页'),
          onPressed: () {
            //替换路由
            Navigator.of(context).pushReplacementNamed('/towPage');
          },
        ),
      ),
    );
  }
}