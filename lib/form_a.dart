import 'package:flutter/material.dart';


void main() => runApp(new MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //表单状态
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  //定义变量
  String _name = '';
  String _surname = '';
  String _telephone = '';
  String _mobile = '';
  String _email = '';
  String _website = '';

  void _onSave() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_name+','+_surname+','+_telephone+','+_mobile+','+_email+','+_website);
    }
    setState((){});
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Flutter Form 表单'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,//绑定状态属性
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (val) {
                      _name = 'Name: '+val;
                    },
                    decoration: InputDecoration(labelText: 'Name',),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _surname = 'Surname：'+val;
                    },
                    decoration: InputDecoration(labelText: 'Surname',),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _telephone = 'Telephone：'+val;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Telephone',),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _mobile = 'Mobile：'+val;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Mobile',),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _email = 'E-Mail：'+val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'E-Mail',),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      _website = 'Website：'+val;
                    },
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(labelText: 'Website',),
                  ),

                  Text('',style: TextStyle(height: 2,),),
                  Text('$_name'),
                  Text('$_surname'),
                  Text('$_telephone'),
                  Text('$_mobile'),
                  Text('$_email'),
                  Text('$_website'),
                ],
              ),
            ),
          ),

          floatingActionButton: new FloatingActionButton(
            onPressed: _onSave,
            child: Text('保存'),
          ),
        )
    );
  }
}
