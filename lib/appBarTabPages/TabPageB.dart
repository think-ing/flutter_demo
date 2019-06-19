import 'package:flutter/material.dart';

class TabPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      child: Text('我是 TabPageB 页面',style: TextStyle(fontSize: 30),),
    );
  }
}