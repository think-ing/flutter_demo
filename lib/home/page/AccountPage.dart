import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      elevation: 25,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '个人主页',
          style: TextStyle(
              fontSize: 35,
              color: Colors.redAccent[200],
              fontWeight: FontWeight.w900),),
      ),
    );
  }
}