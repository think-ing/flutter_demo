import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Chip 标签'),),
        body: Column(
          children: <Widget>[
//-----------------------------------------------------------------------------------
            Wrap(
              //水平间距
              spacing: 8.0,
              //垂直间距
              runSpacing: 10.0,
              //对齐方式
              // alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                Chip(
                  avatar: Icon(Icons.add_alert),
                  label: Text('buttom'),
                  deleteIcon: Icon(Icons.close),
                  deleteIconColor:Colors.red,
                  deleteButtonTooltipMessage:'干啥',
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: Colors.blue,
                  elevation:20,
                  shadowColor:Colors.red,
                  onDeleted: (){
                    print('object');
                  },
                ),
                Chip(label: Text('Text'),),
                Chip(label: Text('TextField'),),
                Chip(label: Text('Form'),),
                Chip(label: Text('Image'),),
                Chip(label: Text('ListView'),),
                Chip(label: Text('GridView'),),
                Chip(label: Text('DateTime'),),
                Chip(label: Text('Animation'),),
                Chip(label: Text('BottomSheet'),),
                Chip(label: Text('Chip'),),
              ],
            ),
//-----------------------------------------------------------------------------------
            ChipTheme(
              //统一设置Chip组件样式
              data: ChipThemeData(
                backgroundColor:Colors.red,
                disabledColor:Colors.yellow,
                selectedColor:Colors.blue,
                secondarySelectedColor:Colors.black,
                labelPadding:EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding:EdgeInsets.all(0),
                shape:BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: new BorderSide(style: BorderStyle.none,)),
                labelStyle:TextStyle(color: Colors.white),
                secondaryLabelStyle:TextStyle(color: Colors.white),
                brightness:Brightness.dark,
                elevation:20,
                shadowColor:Colors.lime,
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 10.0,
                children: <Widget>[
                  Chip(label: Text('Text'),),
                  Chip(label: Text('TextField'),),
                  Chip(label: Text('Form'),),
                  Chip(label: Text('Image'),),
                ],
              ),
            ),

          ],
        )
    );
  }
}