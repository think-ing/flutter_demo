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
          title: Text('Flutter PageA'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('返回'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
    );
  }
}
