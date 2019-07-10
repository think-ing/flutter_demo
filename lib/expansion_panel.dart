import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter ExpansionPanel'),),
      body: MyBodyA(),
    );
  }
}

// list 遍历 添加内容
class MyBodyB extends StatefulWidget {
  @override
  _MyBodyBState createState() => _MyBodyBState();
}

class _MyBodyBState extends State<MyBodyB> {
  int _isExpanded = -1; //闭合控制  默认全部关闭
  List<int> list = [0,1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ExpansionPanelList(
            children :list.map((i){
              return new ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return new ListTile(
                    title: new Text('我是标题 $i'),
                  );
                },
                body: new Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: new ListBody(
                    children: list.map((j){
                      return Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容 $i - $j'),),
                      );
                    }).toList(),
                  ),
                ),
                isExpanded: _isExpanded == i,);
            }).toList(),
            expansionCallback:(panelIndex, isExpanded){
              setState(() {
                _isExpanded = _isExpanded == panelIndex ? -1 : panelIndex;
              });
            },
            animationDuration : kThemeAnimationDuration,
          ),
        ],
      ),
    );
  }
}

// 手写 添加 内容
class MyBodyA extends StatefulWidget {
  @override
  _MyBodyAState createState() => _MyBodyAState();
}

class _MyBodyAState extends State<MyBodyA> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ExpansionPanelList(
            children : <ExpansionPanel>[
              ExpansionPanel(
                headerBuilder:(context, isExpanded){
                  return ListTile(
                    title: Text('我是标题'),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ListBody(
                    children: <Widget>[
                      Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容'),),
                      ),
                      Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容'),),
                      ),
                      Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容'),),
                      ),
                      Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容'),),
                      ),
                      Card(
                        margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(padding: EdgeInsets.all(8),child: Text('我是内容'),),
                      ),
                    ],
                  ),
                ),
                isExpanded: _isExpanded,
                canTapOnHeader: true,
              ),

            ],
            expansionCallback:(panelIndex, isExpanded){
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            animationDuration : kThemeAnimationDuration,
          ),
        ],
      ),
    );
  }
}