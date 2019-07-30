import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _offstage = false;
  String raisedButtonText = 'Offstage隐身 / Visibility出现';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('data'),),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,),
              RaisedButton(
                child: Text(raisedButtonText),
                onPressed: (){
                  setState(() {
                    _offstage = !_offstage;
                    if(_offstage){
                      raisedButtonText = 'Offstage出现 / Visibility隐身';
                    }else{
                      raisedButtonText = 'Offstage隐身 / Visibility出现';
                    }
                  });
                },
              ),

              SizedBox(height: 50,),

              Offstage(
                offstage:_offstage,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: Text('我是Offstage'),
                ),
              ),

              Visibility(
                visible:_offstage,
                replacement:Text('我是隐藏后显示的'),
                maintainState:true,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                  child: Text('我是Visibility'),
                ),
              ),

            ],
          ),
        )
    );
  }
}