import 'package:flutter/material.dart';

class TabPageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      child: Text('我是 TabPageC 页面',style: TextStyle(fontSize: 30),),
    );
  }
}