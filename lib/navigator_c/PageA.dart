import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点击选项返回数据'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: RaisedButton(
                child: Text('点击返回\n\n‘我是张三’'),
                onPressed: (){Navigator.pop(context, '我是张三');},
                textColor: Colors.white,
                color: Colors.blue[500],
                elevation: 15,
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: 100,
              height: 100,
              child: RaisedButton(
                child: Text('点击返回\n\n‘我是李四’'),
                onPressed: (){Navigator.pop(context, '我是李四');},
                textColor: Colors.white,
                color: Colors.blue[500],
                elevation: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}