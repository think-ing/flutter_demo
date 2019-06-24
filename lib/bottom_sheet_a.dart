import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BottomSheet'),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          child: new Text('点我'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                //builder 可以返回任意组件，我们可以尽情的自定义
                return new Container(
                    height: 200.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Text('你好'),
                            onPressed: (){
                              Navigator.pop(context,'你好');
                            },
                          ),
                          RaisedButton(
                            child: Text('我好'),
                            onPressed: (){
                              Navigator.pop(context,'我好');
                            },
                          ),
                          RaisedButton(
                            child: Text('大家好'),
                            onPressed: (){
                              Navigator.pop(context,'大家好');
                            },
                          ),

                        ],
                      ),
                    )
                );
              },
            ).then((val) {
              // 打印 点击返回的数据
              print(val);
            });
          },
        ),
      ),
    );
  }
}