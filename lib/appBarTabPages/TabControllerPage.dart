import 'package:flutter/material.dart';

///通过TabController 定义TabBar

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    print('初始化 数据...');
    _tabController = new TabController(
        vsync: this,//固定写法
        length: 9   //指定tab长度
    );
    //添加监听
    _tabController.addListener((){
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      print("index: $index");
      print('previousIndex: $previousIndex');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('使用TabController完成TabBar'),
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: '推荐',),
                Tab(text: '丽人',),
                Tab(text: '旅行',),
                Tab(text: '电影',),
                Tab(text: '结婚',),
                Tab(text: '购物',),
                Tab(text: '教培',),
                Tab(text: '家装',),
                Tab(text: '亲子',),
              ],
            ),
          ),

          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 1',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 2',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 3',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 4',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 5',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 6',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 7',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 8',style: TextStyle(fontSize: 30),),
              ),
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Text('TabPage 9',style: TextStyle(fontSize: 30),),
              ),
            ],
          )
      ),
    );
  }
}