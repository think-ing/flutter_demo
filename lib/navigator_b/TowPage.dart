import 'package:flutter/material.dart';

class TowPage extends StatefulWidget {
  @override
  _TowPageState createState() => _TowPageState();
}

class _TowPageState extends State<TowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.blue,
          child: Text('下一页'),
          onPressed: () {
            //替换路由
            Navigator.of(context).pushReplacementNamed('/threePage');
          },
        ),
      ),
    );
  }
}