import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Flutter CustomScrollView'),),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary:true,
            leading: Icon(Icons.backup),
            // automaticallyImplyLeading:true,
            pinned: true,
            expandedHeight: 250.0,
            // title: Text('SliverAppBar'),
            flexibleSpace: FlexibleSpaceBar(
              // titlePadding: EdgeInsets.all(15),
              title: Text('CustomScrollView'),
              collapseMode:CollapseMode.parallax,
              background: Image.asset('images/ba.jpg', fit: BoxFit.cover),
            ),
            backgroundColor: Theme.of(context).accentColor,

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  // handle the press
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Open settings',
                onPressed: () {
                  // handle the press
                },
              ),
            ],

            // bottom:PreferredSize(
            //   child: Icon(Icons.shopping_cart),
            //   preferredSize: Size(50, 50),
            // ),
            elevation:10.0,
            forceElevated:true,
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Card(
                    child: FlatButton(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('grid $index'),
                      ),
                      onPressed: (){
                        print('grid $index');
                      },
                    )
                );
              },
              childCount: 20,
            ),
          ),

          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              minHeight:55,
              maxHeight:200,
            ),
            pinned: true,
            floating: false,
          ),

          SliverFixedExtentList(
            itemExtent: 50.0,
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
                      child: Text('data $index'),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    //根据shrinkOffset可变值 和maxHeight最大值  计算出50到100之间的曲线
    double imgSize = ((maxHeight-shrinkOffset)/maxHeight*0.5+0.5)*100;
    //计算出 0.5 到 1 之间的曲线
    double imgX = (shrinkOffset / maxHeight * -0.5 -0.5) * 0.98;
    double imgY = (1 - shrinkOffset / maxHeight) * -0.6;

    //标题size曲线
    double textSize = imgSize / 3;
    //根据shrinkOffset可变值 和maxHeight最大值  计算出0.5到0.7之间的曲线
    double textX = (shrinkOffset / maxHeight * -0.2 -0.5);
    double textY = (1 - shrinkOffset / maxHeight) * 0.8;

    Widget child = Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(imgX,imgY),
            // child: Container(width: imgSize,height: imgSize,color: Colors.red,),
            child:ClipOval(
              child: Image.asset('images/ba.jpg', fit: BoxFit.cover,height: imgSize,width: imgSize,),
            ),
          ),

          Align(
            alignment: Alignment(textX,textY),
            child: Text('我是标题',style: TextStyle(fontSize: textSize),),
          ),

          Positioned(
              right: 50,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.add_a_photo,color: Colors.white,),
                onPressed: (){print('object');},
              )
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.settings,color: Colors.white,),
                onPressed: (){print('object');},
              )
          ),

        ],
      ),
      color: Color(0xffFF8000),
    );
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    print('object 2 ');
    return null;
    // return maxHeight != oldDelegate.maxHeight ||
    //     minHeight != oldDelegate.minHeight ||
    //     child != oldDelegate.child;
  }
}