import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Date and Time'),),
        body: RaisedButton(
          onPressed: (){

            var today = DateTime.now();
            print('当前时间是：$today');
            var date1 = today.millisecondsSinceEpoch;
            print('当前时间戳：$date1');
            var date2 = DateTime.fromMillisecondsSinceEpoch(date1);
            print('时间戳转日期：$date2');
            //拼接成date
            var dentistAppointment = new DateTime(2019, 6, 20, 17, 30,20);
            print(dentistAppointment);
            // 字符串转date
            DateTime date3 = DateTime.parse("2019-06-20 15:32:41");
            print(date3);
            // 时间比较
            print(today.isBefore(date3));// 在之前
            print(today.isAfter(date3)); // 在之后
            print(date3.isAtSameMomentAs(date3));// 相同

            print(date3.compareTo(today));// 大于返回1；等于返回0；小于返回-1。
            // print(DateTime.now().toString());
            // print(DateTime.now().toIso8601String());

            //时间增加
            var fiftyDaysFromNow = today.add(new Duration(days: 5));
            print('today加5天：$fiftyDaysFromNow');
            //时间减少
            DateTime fiftyDaysAgo = today.subtract(new Duration(days: 5));
            print('today减5天：$fiftyDaysAgo');
            //时间差   两个时间相差 小时数
            print('比较两个时间 差 小时数：${fiftyDaysFromNow.difference(fiftyDaysAgo)}');

            print('本地时区简码：${today.timeZoneName}');

            print('返回UTC与本地时差 小时数：${today.timeZoneOffset}');

            print('获取年月日：${today.year}');//month、day、hour、minute、second、millisecond、microsecond

            print('星期：${today.weekday}');// 返回星期几

          },
        ),
      ),
    );
  }
}