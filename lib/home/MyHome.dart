import 'package:flutter/material.dart';
import 'page/AccountPage.dart';
import 'page/CategoryPage.dart';
import 'page/HomePage.dart';
import 'page/SettingsPage.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;

  List _pageList = [HomePage(),CategoryPage(),SettingsPage(),AccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter BottomNavigationBar 组件'),),
      body: this._pageList[this._currentIndex],

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {print('咔嚓...咔嚓...');},
        tooltip: '干啥',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.pink,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.red,
        // iconSize: 40,
        // elevation: 20,


        currentIndex: _currentIndex,
        onTap: (int index){
          if(index != 2){
            if(index > 2){
              index -= 1;
            }
            setState(() {
              _currentIndex = index;
            });
          }

        },
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
            icon: Text(''),
            title: Text(''),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('设置')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的')
          ),

        ],
      ),
    );
  }
}