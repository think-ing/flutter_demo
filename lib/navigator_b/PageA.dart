import 'package:flutter/material.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是 PageA 页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('下一页'),
          onPressed: () {
            //跳转
            Navigator.of(context).pushNamed('/pageB');
          },
        ),
      ),
    );
  }
}