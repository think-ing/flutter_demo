import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是 PageB 页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('下一页'),
          onPressed: () {
            //跳转
            Navigator.of(context).pushNamed('/pageC');
          },
        ),
      ),
    );
  }
}