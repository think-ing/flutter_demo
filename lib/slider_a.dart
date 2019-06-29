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

  double valuec = 0;
  double valued = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Slider Demo'),),
      body: Column(
        children: <Widget>[

          SizedBox(height: 50,),

          Slider(
              label:'Slider ${valuec.round()}',
              max: 100,
              min: 0,
              divisions: 5,
              activeColor:Colors.blue,
              inactiveColor: Colors.yellow,

              value:this.valuec,
              onChanged: (double v) {
                setState(() {
                  this.valuec = v;
                });
              },
              onChangeStart: (double startValue) {
                print('Started change at $startValue');
              },
              onChangeEnd: (double newValue) {
                print('Ended change on $newValue');
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()} dollars';
              }
          ),

          CupertinoSlider(
            value:this.valued,
            onChanged: (double v) {
              setState(() {
                this.valued = v;
              });
            },
          ),

        ],
      ),
    );
  }
}