import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime nowDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Date & Time Pickers'),),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Padding(padding: EdgeInsets.all(10),child: Text('$nowDate'),),
              onTap: (){
                mDatePicker();
              },

            )
          ],
        ),

      ),
    );
  }
  //打开日期选择器
  mDatePicker() async{
    var result = await showDatePicker(
      context:context,
      initialDate:nowDate,
      firstDate:DateTime(1900),
      lastDate:DateTime(2100),
      selectableDayPredicate:(nowDate){
        return nowDate.isBefore(DateTime(2019,7,20));
      },
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    if(result!= null){
      nowDate =  result;
      mTimePicker();
    }

  }
  //打开时间选择器
  mTimePicker() async {
    TimeOfDay result = await showTimePicker(
      context:context,
      initialTime:TimeOfDay.fromDateTime(nowDate),
    );
    if(result!= null){
      setState(() {
        //更改显示时间（）
        nowDate = new DateTime(nowDate.year,nowDate.month,nowDate.day, result.hour,result.minute);
      });
    }
  }

}