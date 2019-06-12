import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      elevation: 25,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '分类页面',
          style: TextStyle(
              fontSize: 35,
              color: Colors.green,
              fontWeight: FontWeight.w900),),
      ),
    );
  }
}