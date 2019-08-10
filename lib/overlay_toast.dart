import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tools/Toast.dart';

// void main() => runApp(MyApp());

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
  int i = 0;
  String str = '我是 Toast';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Overlay'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: (){
                    str += '啊啊啊啊';
                  },
                ),
                RaisedButton(
                    child: Text('渐变效果'),
                    onPressed:(){
                      Toast.makeText(context:context, content:'渐变显示与隐藏 ${++i} $str').show();
                    }
                ),

                RaisedButton(
                    child: Text('上下效果'),
                    onPressed:(){
                      Toast.makeText(context:context, content:'底部弹出隐藏到底部 ${++i} $str',animated: Toast.ANIMATED_MOVEMENT_BTB).show();
                    }
                ),

                RaisedButton(
                    child: Text('左右效果'),
                    onPressed:(){
                      Toast.makeText(context:context, content:'左边滑出隐藏到右边 ${++i} $str',animated: Toast.ANIMATED_MOVEMENT_LCR).show();
                    }
                ),

                RaisedButton(
                    child: Text('自定义效果'),
                    onPressed:(){
                      Toast.makeText(context:context, child: _customToastLayout(context),animated: Toast.ANIMATED_MOVEMENT_LCR).show();
                    }
                ),

                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: (){
                    if(str.length > 14){
                      str = str.substring(0,str.length - 4);
                    }else{
                      str = '我是 Flutter';
                    }
                  },
                ),

              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('Tween'),
                    onPressed:(){
                      Toast.makeText(context:context, content:'Tween动画带曲线 ${++i} $str',animated: Toast.ANIMATED_MOVEMENT_TWEEN).show();
                    }
                ),
              ],
            )
          ],
        ),
      ),

    );
  }

  //toast绘制 自定义
  static _customToastLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5 * 4,
      child: Card(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: ListTile(
            leading:Image.network('https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=eea934627f8da9775a228e79d138937c/b3b7d0a20cf431ad6fd6b4684736acaf2edd985f.jpg'),
            title: Text('Flutter',style: TextStyle( fontSize: 20.0, color: Colors.white, )),
            subtitle: Text('Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。',style: TextStyle( fontSize: 12.0, color: Colors.white, )),
          ),
        ),
      ),
    );
  }

}