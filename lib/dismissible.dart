import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

// class MyHome extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   List<String> list;
//   @override
//   void initState() {
//     super.initState();
//     list = new List<String>.generate(25, (i) => " Item $i ");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Dismissible'),),
// body: ListView.builder(
//   itemCount: list.length,
//   itemBuilder: (context, index) {
//     var item = list[index];
//     return Dismissible(
//       background: Container(color: Colors.red,),
//       secondaryBackground: Container(color: Colors.green,),
//       dragStartBehavior:DragStartBehavior.start,
//       key: Key(item),
//       child: ListTile(
//         title: Text(item),
//       ),
//     );
//   }
// )
//     );
//   }
// }

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> list;
  bool deleteDialog = true;
  bool collectDialog = true;

  @override
  void initState() {
    super.initState();
    list = new List<String>.generate(25, (i) => " Item $i ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dismissible'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var item = list[index];
            return Dismissible(
              // crossAxisEndOffset:1.0,
              dragStartBehavior:DragStartBehavior.start,
              key: Key(item),
              child: ListTile(
                title: Text(item),
              ),
              background: Container(
                color: Colors.green,
                child: ListTile(
                  subtitle: Center(child: Text('收藏  $item ',style: TextStyle(color: Colors.white),),),
                  leading: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: ListTile(
                  subtitle: Center(child: Text('删除  $item ',style: TextStyle(color: Colors.white),),),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              confirmDismiss: (direction) async {
                var _alertDialog;
                if (direction == DismissDirection.startToEnd && collectDialog) {
                  // 收藏
                  _alertDialog = MyAlertDialog(
                    dialogContent: '确认收藏${list[index]}',
                    yesWidget: FlatButton(
                      child: Text('YES'),
                      onPressed: () {
                        collectDialog = !_alertDialog.getTemp;
                        Navigator.of(context).pop(true);
                      },
                    ),
                    noWidget: FlatButton(
                      child: Text('NO'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  );
                } else if (direction == DismissDirection.endToStart &&
                    deleteDialog) {
                  // 删除
                  _alertDialog = MyAlertDialog(
                    dialogContent: '确认删除${list[index]}',
                    yesWidget: FlatButton(
                      child: Text('YES'),
                      onPressed: () {
                        deleteDialog = !_alertDialog.getTemp;
                        Navigator.of(context).pop(true);
                      },
                    ),
                    noWidget: FlatButton(
                      child: Text('NO'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  );
                } else {
                  return true;
                }

                if (_alertDialog != null) {
                  var isDismiss = await showDialog(
                      context: context,
                      builder: (context) {
                        return _alertDialog;
                      });
                  return isDismiss;
                }
              },
            );
          },
        ));
  }
}

class MyAlertDialog extends StatefulWidget {
  bool temp = false;
  String dialogContent;
  Widget yesWidget;
  Widget noWidget;

  MyAlertDialog(
      {this.dialogContent, this.yesWidget, this.noWidget}) {
    if (dialogContent.isEmpty) {
      dialogContent = '请确认当前操作！！';
    }
  }

  bool get getTemp => temp;

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    if (widget.yesWidget == null) {
      widget.yesWidget = FlatButton(
        child: Text('YES'),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      );
    }
    if (widget.noWidget == null) {
      widget.noWidget = FlatButton(
        child: Text('NO'),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      );
    }

    return AlertDialog(
      // title: Text('我是标题'),
      content: Container(
        child: Text(widget.dialogContent),
      ),
      actions: <Widget>[
        Offstage(
          offstage: widget.dialogContent.isEmpty,
          child: Row(
            children: <Widget>[
              Text('不在显示'),
              Checkbox(
                value: widget.temp,
                onChanged: (bool value) {
                  setState(() {
                    widget.temp = value;
                  });
                },
              ),
            ],
          ),
        ),
        widget.yesWidget,
        widget.noWidget,
      ],
      elevation: 20,
      // 设置成 圆角
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}