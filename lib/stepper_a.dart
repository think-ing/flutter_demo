import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //输入框 控制器
  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //定义按钮文字
  String strCancel = '返回';
  String strContinue = '下一步';

  //定义文本框空值提醒颜色
  // TextStyle nullStyle = TextStyle(color: Colors.red);
  Color labelColor = Colors.grey[400];

  int currentStepIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scrollbar Demo'),
      ),
      body: Stepper(
        //当前步骤下标
        currentStep: this.currentStepIndex,
        //上一步
        onStepCancel: () {
          if (currentStepIndex > 0) {
            setState(() {
              currentStepIndex--;
              labelColor = Colors.grey[400];
              if (currentStepIndex == 0) {
                strCancel = '返回';
              } else {
                strCancel = '上一步';
              }
              if (currentStepIndex == 3) {
                strContinue = '提交';
              } else {
                strContinue = '下一步';
              }
            });
          } else {
            print('返回...');
          }
        },
        //下一步
        onStepContinue: () {
          setState(() {
            if (currentStepIndex == 0 && nameController.text.isEmpty) {
              labelColor = Colors.red;
            } else if (currentStepIndex == 1 && telController.text.isEmpty) {
              labelColor = Colors.red;
            } else if (currentStepIndex == 2 && codeController.text.isEmpty) {
              labelColor = Colors.red;
            } else if (currentStepIndex == 3 && passController.text.isEmpty) {
              labelColor = Colors.red;
            } else {
              if (currentStepIndex == 3) {
                print('数据提交...');
              }
              if (currentStepIndex < 3) {
                currentStepIndex++;
              }
              labelColor = Colors.grey[400];
            }
            if (currentStepIndex == 0) {
              strCancel = '返回';
            } else {
              strCancel = '上一步';
            }
            if (currentStepIndex == 3) {
              strContinue = '提交';
            } else {
              strContinue = '下一步';
            }
          });
        },
        //自定义按钮
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: <Widget>[
              FlatButton(
                onPressed: onStepContinue,
                child: Text(strContinue),
              ),
              FlatButton(
                onPressed: onStepCancel,
                child: Text(strCancel),
              ),
            ],
          );
        },
        // 步骤集合
        steps: <Step>[
          Step(
            title: Text(' 姓 名 '),
            content: TextField(
              controller:
              nameController, //控制器，控制TextField文字   同 Android View id
              decoration: new InputDecoration(
                labelText: '请输入你的姓名',
                labelStyle: TextStyle(color: labelColor),
              ),
            ),
            subtitle: Text(nameController.text.trim()),
            isActive: currentStepIndex == 0,
          ),
          Step(
            title: Text(' 电 话 '),
            content: TextField(
              controller: telController, //控制器，控制TextField文字   同 Android View id
              decoration: new InputDecoration(
                labelText: '请输入你的电话',
                labelStyle: TextStyle(color: labelColor),
              ),
            ),
            subtitle: Text(telController.text.trim()),
            isActive: currentStepIndex == 1,
          ),
          Step(
            title: Text('验证码'),
            content: TextField(
              controller:
              codeController, //控制器，控制TextField文字   同 Android View id
              decoration: new InputDecoration(
                labelText: '请输入验证码',
                labelStyle: TextStyle(color: labelColor),
              ),
            ),
            subtitle: Text(codeController.text.trim()),
            isActive: currentStepIndex == 2,
          ),
          Step(
            title: Text(' 密 码 '),
            content: TextField(
              controller:
              passController, //控制器，控制TextField文字   同 Android View id
              decoration: new InputDecoration(
                labelText: '请输入你的密码',
                labelStyle: TextStyle(color: labelColor),
              ),
              obscureText: true,
            ),
            subtitle: Text(passController.text.trim().isEmpty ? '' : '●●●●●●'),
            isActive: currentStepIndex == 3,
          ),
        ],
      ),
    );
  }
}