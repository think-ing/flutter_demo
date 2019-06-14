import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 路由替换（返回到根）'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('替换路由的方式 完成返回首页功能'),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.blue,
                child: Text('下一页'),
                onPressed: () {
                  //正常是这样跳转路由的
                  Navigator.of(context).pushNamed('/onePage');
                },
              ),

              SizedBox(height: 50,),

              Text('清除路由的方式 完成返回首页功能'),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.blue,
                child: Text('下一页'),
                onPressed: () {
                  //正常是这样跳转路由的
                  Navigator.of(context).pushNamed('/pageA');
                },
              ),
            ],
          )),
    );
  }
}
