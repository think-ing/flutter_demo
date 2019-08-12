import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //数据列表
  List list = new List();
  int x = 0;

  // 初始化数据
  @override
  void initState() {
    super.initState();
    getData('初始化数据');
  }

  /*
   * 获取数据
   */
  Future getData(String s) async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(20, (i) => '$s $i');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RefreshIndicator 下拉刷新'),),
      body: RefreshIndicator(
        child:ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(this.list[index]),
            );
          },
        ),
        onRefresh:_onRefresh,
        // displacement:30,
        color:Colors.red,
        backgroundColor:Colors.green,
        // notificationPredicate:,
        semanticsLabel:'哈哈',
        semanticsValue:'sdfjnlsdjf',
      ),
    );
  }

  // 下拉监听 处理
  Future<Null> _onRefresh() async {
    x++;
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        list = List.generate(20, (i) => '第 $x 次刷新后数据 $i');
      });
    });
  }
}