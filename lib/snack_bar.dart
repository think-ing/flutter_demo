import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HmoePage(),
  ));
}

class HmoePage extends StatefulWidget {
  @override
  _HmoePageState createState() => _HmoePageState();
}

class _HmoePageState extends State<HmoePage> {
  final snackBar = new SnackBar(content: new Text('这是一个SnackBar!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter SnackBar'),),

      body: Container(
        alignment: Alignment.center,
        // child: RaisedButton(
        //   child: Text('点我'),
        //   onPressed: (){
        //     Scaffold.of(context).showSnackBar(snackBar);
        //   },
        // ),

        child: Builder(builder: (BuildContext context) {
          return Center(
            child: InkWell(
              onTap: () {
                final mySnackBar = SnackBar(
                  content: Text('我是SnackBar'),
                  backgroundColor: Colors.black26,
                  duration: Duration(seconds: 1),
                  behavior:SnackBarBehavior.fixed,
                  // behavior:SnackBarBehavior.floating,//显示在[底部导航栏]上方
                  action: SnackBarAction(
                      label: '我是scackbar按钮',
                      onPressed: () {
                        print('点击了snackbar按钮');
                      }
                  ),
                );
                Scaffold.of(context).showSnackBar(mySnackBar);
              },
              child: Padding(padding: EdgeInsets.all(10),child: Text('点 我'),),
            ),
          );
        }),
      ),
    );
  }
}