import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      elevation: 25,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '我是首页',
          style: TextStyle(
              fontSize: 35,
              color: Colors.orange,
              fontWeight: FontWeight.w900),),
      ),
    );
  }
}