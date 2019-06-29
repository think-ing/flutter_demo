import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valuea = false;
  bool valueb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Switch Demo'),),
      body: Column(
        children: <Widget>[
          Switch(
            activeColor:Colors.red,
            activeTrackColor:Colors.yellow,
            inactiveThumbColor:Colors.pink[200],
            inactiveTrackColor:Colors.black,
            // activeThumbImage:AssetImage('images/aa.jpg'),
            // inactiveThumbImage:AssetImage('images/ba.jpg'),
            dragStartBehavior:DragStartBehavior.start,

            value: this.valuea,
            onChanged: (bool v) {
              setState(() {
                this.valuea = v;
              });
            },
          ),
          SizedBox(height: 30,),

          CupertinoSwitch(
            value: this.valueb,
            onChanged: (bool value) {
              setState(() {
                this.valueb = value;
              });
            },
          ),
        ],
      ),
    );
  }
}