import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('我是标题'),
        content:Text('我是content'),
        actions:<Widget>[
          FlatButton(
            child: Text('YES'),
            onPressed: (){
              print('yes...');
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('NO'),
            onPressed: (){
              print('no...');
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor:Colors.yellowAccent,
        elevation: 20,
        semanticLabel:'哈哈哈哈',
        // 设置成 圆角
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );
    },
  );
}