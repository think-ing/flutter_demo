import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mCupertinoAlertDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('我是标题'),
        content:Text('我是content'),
        actions:<Widget>[

          CupertinoDialogAction(
            child: Text('YES'),
            onPressed: (){
              print('yes...');
              Navigator.of(context).pop();
            },
          ),

          CupertinoDialogAction(
            child: Text('NO'),
            onPressed: (){
              print('no...');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}