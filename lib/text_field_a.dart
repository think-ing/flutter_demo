import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter文本框TextField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext myContext;
  //用户名的控制器
  TextEditingController userController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myContext = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('文本框TextField'),
        ),
        body: new ListView(
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(hintText: "This is a hint",helperText: '官方表单Demo'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: '数字优先的文本框',
              ),
            ),
            TextField(
              decoration: new InputDecoration(
                icon: Icon(Icons.phone),//添加一个图标
                labelText: '请输入你的用户名',
                helperText: '带图标和Label的文本输入框',
              ),
            ),
            TextField(
              decoration: new InputDecoration(
                icon: Icon(Icons.lock),//添加一个图标
                labelText: '请输入密码',
                helperText: '带图标和Label的密码输入框',
              ),
              obscureText: true, //是否隐藏输入
            ),


            //--------------------------------模拟登陆---------------------------
            Text('模拟登陆',style: TextStyle(fontSize: 20,height: 3,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            TextField(
              controller: userController, //控制器，控制TextField文字   同 Android View id
              decoration: new InputDecoration(
                icon: Icon(Icons.phone),//添加一个图标
                labelText: '请输入你的用户名',
              ),
              autofocus: false,
            ),
            TextField(
              controller: passController,
              decoration: new InputDecoration(
                icon: Icon(Icons.lock),//添加一个图标
                labelText: '请输入密码',
              ),
              obscureText: true, //
            ),
            new Container(
                width: 340.0,
                padding: new EdgeInsets.all(20),
                child: new Card(
                    color: Colors.blue,
                    elevation: 16.0,
                    child: new FlatButton(
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text(
                            '登  录',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        onPressed: _login
                    )
                )
            ),

          ],
        )
    );
  }
  //登陆校验
  void _login() {
    print({'用户名': userController.text, '密码': passController.text});
    if(userController.text.isEmpty){
      myDialog('请输入用户名！');
    }else if(passController.text.isEmpty){
      myDialog('请输入密码！');
    }else if(userController.text == 'mzw' && passController.text == '123'){
      myDialog('登陆成功！');
      userController.clear();
      passController.clear();
    }else {
      myDialog('用户密码错误！');
    }
  }

  //对话框
  void myDialog(String msg){
    print(myContext);
    showDialog(
      context: myContext,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text(
          '温馨提示',
          style: new TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
        content: new Text(msg),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.pop(myContext);
              },
              child: new Text('确定')),
        ],
      ),
    );
  }
}
