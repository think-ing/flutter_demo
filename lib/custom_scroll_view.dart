import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView'),
            ),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,//子控件宽高比
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Card(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text('grid $index'),
                  ),
                );
              },
              childCount: 11,
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              //返回组件集合
              List.generate(20, (int index){
                //返回 组件
                return GestureDetector(
                  onTap: () {
                    print("点击$index");
                  },
                  child: Card(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('list $index'),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}