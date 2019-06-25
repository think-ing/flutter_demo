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
  bool valuec = false;
  bool valued = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Checkbox 复选框'),),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text('简单复选框：'),SizedBox(width: 20,),
                  Checkbox(
                    checkColor: Colors.yellowAccent,
                    activeColor: Colors.red,
                    value: this.valuea,
                    onChanged: (bool value) {
                      setState(() {
                        this.valuea = value;
                      });
                    },
                  ),
                  Checkbox(
                    value: this.valueb,
                    onChanged: (bool value) {
                      setState(() {
                        this.valueb = value;
                      });
                    },
                  ),
                ],
              ),

              CheckboxListTile(
                secondary: const Icon(Icons.alarm),
                title: const Text('每天6：00 响铃'),
                subtitle: Text('12小时48分钟后响铃'),
                value: this.valuec,
                onChanged: (bool value) {
                  setState(() {
                    this.valuec = value;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: const Icon(Icons.alarm_on),
                title: const Text('每天6：10 响铃'),
                subtitle: Text('12小时58分钟后响铃'),
                value: this.valued,
                onChanged: (bool value) {
                  setState(() {
                    this.valued = value;
                  });
                },
              ),

            ],
          )
        ),
      ),
    );
  }
}