import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mCupertinoFullscreenDialogTransition(BuildContext context,Animation<double> opacity) {

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CupertinoFullscreenDialogTransition(
          child: Scaffold(
            body: Container(
              alignment: Alignment.center,
              child: Text('我是IOS风格的全屏对话框'),
            ),
          ),
          animation: opacity
      );
    },
  );
}