import 'package:flutter/material.dart';

class PageC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter PageC'),),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('返回'),
                onPressed: () {Navigator.pop(context);},
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        )
    );
  }
}