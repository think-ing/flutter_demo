import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Button 组件'),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[500],
          child: Icon(Icons.add_comment),
          tooltip:'干啥',
          onPressed: () {print('我是Floating Action Button');},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: MyBody(),

      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  var value;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              RaisedButton(
                child: Text('普通按钮'),
                onHighlightChanged:(bool b) {
                  print(b);
                },
                onPressed: (){},
              ),

              RaisedButton(
                child: Text('带颜色'),
                onPressed: (){},
                textColor: Colors.white,
                color: Colors.blue[200],
              ),

              RaisedButton(
                child: Text('带颜色带阴影'),
                onPressed: (){},
                textColor: Colors.white,
                color: Colors.blue[200],
                elevation: 15,
              ),

              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  child: Text('设置宽高'),
                  onPressed: (){},
                  textColor: Colors.white,
                  color: Colors.blue[500],
                  elevation: 15,
                ),
              ),

              RaisedButton.icon(
                icon: Icon(Icons.account_box),
                label: Text('我前边有图标'),
                onPressed: () {},
              ),

              RaisedButton(
                child: Text('圆角按钮'),
                onPressed: (){},
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

              Container(
                width: 100,
                height: 100,
                child: RaisedButton(
                    child: Text('圆形按钮'),
                    onPressed: (){},
                    color: Colors.red,
                    shape: CircleBorder(
                      // side: BorderSide(color: Colors.yellow[500])
                    )
                ),
              ),

              RaisedButton(
                child: Text('水波纹'),
                onPressed: (){},
                color: Colors.blue[200],
                splashColor:Colors.yellow[100],
              ),

              RaisedButton(
                child: Text('长按变色'),
                onPressed: (){},
                color: Colors.blue[200],
                highlightColor:Colors.red[500],
              ),

              FlatButton(
                child: Text('扁平按钮'),
                onPressed: (){},
                color: Colors.blue[200],
              ),

              OutlineButton(
                child: Text('边框按钮'),
                onPressed: (){},
                textColor: Colors.red,
                borderSide: BorderSide(color: Colors.red,),
              ),

              IconButton(
                icon: Icon(Icons.access_alarms),
                onPressed: () {},
                color: Colors.deepOrange,
                splashColor:Colors.limeAccent,
                highlightColor:Colors.blue[300],
                tooltip:'干啥',
              ),

              DropdownButton(
                hint:new Text('请选择...'),
                value: value,//下拉菜单选择完之后显示给用户的值
                iconSize: 50.0,//设置三角标icon的大小
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    value: '1',
                    child: Text('One'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Two'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('Three'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('four'),
                  ),
                  DropdownMenuItem(
                    value: '5',
                    child: Text('five'),
                  ),
                ],
                onChanged: (v) {
                  setState(() {
                    print(v);
                    value = v;
                  });
                },
              ),
            ],
          ),


          Container(
            color: Colors.pink[100],
            child: ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('按钮一'),
                  onPressed: (){},
                  textColor: Colors.white,
                  color: Colors.blue,
                  elevation: 15,
                ),
                RaisedButton(
                  child: Text('按钮二'),
                  onPressed: (){},
                  textColor: Colors.white,
                  color: Colors.blue,
                  elevation: 15,
                ),
              ],
            ),
          ),

          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Text("一个Button事件与回调，更改数值"),

                SizedBox(height: 15,),
                Text("$count",style: TextStyle(fontSize: 50,color: Colors.purple,fontWeight:FontWeight.w800)),
                SizedBox(height: 20,),

                RaisedButton(
                  child: Text('点我',style: TextStyle(fontSize: 18),),
                  onPressed: (){setState(() {
                    count += 1;
                  });},
                  textColor: Colors.white,
                  color: Colors.blue,
                  elevation: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}