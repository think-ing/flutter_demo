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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Flutter PopupMenu'),
      ),
      body: new Stack(
        children: [
          //  PopupMenuButton
          PopupMenuButton(
            onCanceled: (){
              print('object');
            },
            onSelected: (v){
              print('object   $v');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry> list = List<PopupMenuEntry>();
              list.add(PopupMenuItem(
                value: '1',
                child: Text('Item 1'),
              ),);

              list.add(PopupMenuItem(
                value: '2',
                child: Text('Item 2'),
              ),);
              list.add(PopupMenuDivider(),);
              list.add(CheckedPopupMenuItem(
                value: '3',
                child: Text('Item 3'),
                checked:true,
              ),);
              return list;
            },
          ),

          // showMenu 方式
          // RaisedButton(
          //   child: Text('点我'),
          //   onPressed: (){
          //     showMenu(
          //       context: context,
          //       items: <PopupMenuEntry>[
          //         //items 子项
          //         PopupMenuItem(
          //           value: '1',
          //           child: Text('Item 1'),
          //         ),
          //         PopupMenuItem(
          //           value: '2',
          //           child: Text('Item 2'),
          //         ),
          //         // 分割线
          //         PopupMenuDivider(),
          //         // 带有复选标记的子项
          //         CheckedPopupMenuItem(
          //           value: '2',
          //           child: Text('Item 2'),
          //           checked:true,
          //         ),
          //       ],
          //       position: RelativeRect.fill,
          //     );
          //   },
          // )

        ],
      ),
    );
  }
}


