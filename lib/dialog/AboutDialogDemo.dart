import 'package:flutter/material.dart';


void mAboutDialog(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AboutDialog(
          applicationName:'APP名称',
          applicationVersion:'1.0.9527',
          applicationIcon:Icon(Icons.settings_applications),
          // applicationLegalese:'北京',
          children: <Widget>[
            Text('我是文本'),
            Text('我是文本'),
            Text('我是文本'),
            Text('我是文本'),
          ],
        );
      }
  );


  // showAboutDialog(
  //   context: context,
  //   applicationName:'APP名称',
  //   applicationVersion:'1.0.9527',
  //   applicationIcon:Icon(Icons.settings_applications),
  //   // applicationLegalese:'北京',
  //   children: <Widget>[
  //     Text('我是文本'),
  //     Text('我是文本'),
  //     Text('我是文本'),
  //     Text('我是文本'),
  //   ],
  // );
}