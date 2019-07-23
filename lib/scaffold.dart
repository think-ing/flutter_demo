import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是appBar'),
      ),
      body: Align(alignment: Alignment.center,child: Text('我是body'),),
      floatingActionButton: FloatingActionButton(child: Text('点我'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonAnimator: ,
      persistentFooterButtons: [
        IconButton(icon:Icon(Icons.add),onPressed: () {},),
        FlatButton(child: Text('哈哈'),
          onPressed: () {},),
        RaisedButton(
          child: Text('我是',style: TextStyle(color: Colors.white),),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('底部',style: TextStyle(color: Colors.white),),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('按钮',style: TextStyle(color: Colors.white),),
          onPressed: () {},
        )
      ],
      drawer: Drawer(child: Align(alignment: Alignment.center,child: Text('我是drawer'),),),
      endDrawer: Drawer(child: Align(alignment: Alignment.center,child: Text('我是endDrawer'),),),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('首页')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text('分类')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('设置')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('我的')
            ),
          ]
      ),
      bottomSheet: Text('我是bottomSheet'),
      backgroundColor: Colors.blue[100],
      // resizeToAvoidBottomPadding: ,
      resizeToAvoidBottomInset: true,
      primary: true,
      // drawerDragStartBehavior: DragStartBehavior.start,
      // extendBody: false,
      drawerScrimColor: Colors.red[100],
    );
  }
}
