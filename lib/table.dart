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
      appBar: AppBar(title: Text('data'),),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Table(
          //所有列宽  默认平均等分
          columnWidths: const {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(0.5),
            2: FlexColumnWidth(1.0),
            3: FlexColumnWidth(1.5),
          },
          //表格边框样式
          border: TableBorder.all(
            color: Colors.red,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          children: [
            TableRow(
              //表格行背景
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                ),
                children: [
                  //可以使用padding将行高撑起来
                  Padding(padding: EdgeInsets.all(8),child: Text('姓名'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('性别'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('电话'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('地址'),),
                ]
            ),
            TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                ]
            ),
            TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                  Padding(padding: EdgeInsets.all(8),child: Text('data'),),
                ]
            ),
            TableRow(
                children: [
                  //可以使用SizedBox 设置行高
                  SizedBox(height: 30,child: Text('data'),),
                  SizedBox(height: 30,child: Text('data'),),
                  SizedBox(height: 30,child: Text('data'),),
                  // SizedBox(height: 30,child: Text('data'),),
                  Text('data')
                ]
            ),
          ],
        ),
      ),
    );
  }
}