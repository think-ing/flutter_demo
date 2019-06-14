import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('返回'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}