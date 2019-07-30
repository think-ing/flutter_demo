import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter InkWell'),),
        // body: Container(
        //   color: Colors.red,
        //   alignment: Alignment.center,
        //   child: InkWell(
        //     onTap: (){print('----');},
        //     child: Text('我是InkWell'),
        //   ),
        // ),

        body: Material(
            color: Colors.red,
            child: new InkWell(
              onTap: (){print('--InkWell--');},
              child: Container(
                // width: 200,
                // height: 200,
                alignment: Alignment.center,
                child: Text('我是InkWell'),
              ),

              focusColor:Colors.blue,
              hoverColor:Colors.blue,
              highlightColor:Colors.blue,
              splashColor:Colors.yellow,
              // radius:50.0,
              borderRadius:BorderRadius.all(Radius.circular(200)),
              excludeFromSemantics:false,
            )
        )

    );
  }
}