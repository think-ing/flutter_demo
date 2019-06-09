import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter GridView组件'),),
        // body: MyBodyA(),//GridView.count 实现网格布局
        body: MyBodyB(),//GridView.builder  实现网格布局
      ),
    );
  }
}

//GridView.builder  实现网格布局
class MyBodyB extends StatelessWidget {

  List list = new List();
  MyBodyB(){
    for(int i = 1; i < 20; i++){
      int j = ( i % 9 ) + 1;
      var temp = {"imageurl":"https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/$j.jpg","title":"标题$i"};
      list.add(temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing:5,
        crossAxisSpacing:5,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        // return Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Colors.red,
        //       width: 2,
        //     )
        //   ),
        //   child: Column(
        //     children: <Widget>[
        //       Image.network(list[index]['imageurl'], fit: BoxFit.cover,),
        //       Text(list[index]['title']),
        //     ],
        //   ),
        // );

        //不会出现  越界错误
        return Card(
            child: Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.network(list[index]['imageurl']),
                ),
                Container(
                  height: 30.0,
                  alignment: Alignment.center,
                  color: Colors.blue[200],
                  child: Text(list[index]['title'],),
                ),
              ],
            )
        );
      },
    );
  }
}

//GridView.count 实现网格布局 -----------------------------------------------------------
class MyBodyA extends StatelessWidget {

  List<Widget> getdate(){
    List<Widget> list = new List();
    for(int i = 1; i < 20; i++){
      int j = ( i % 9 ) + 1;
      list.add(Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 2,
            )
        ),
        child: Column(
          children: <Widget>[
            Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/$j.jpg', fit: BoxFit.cover,),
            Text('标题$i'),
          ],
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(5),
      crossAxisCount: 3,
      mainAxisSpacing:5,
      crossAxisSpacing:5,
      children: getdate(),
    );
  }
}