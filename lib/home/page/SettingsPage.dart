import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      elevation: 25,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '设置页面',
          style: TextStyle(
              fontSize: 35,
              color: Colors.blue,
              fontWeight: FontWeight.w900),),
      ),
    );
  }
}