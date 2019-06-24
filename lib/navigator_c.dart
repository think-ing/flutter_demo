import 'package:flutter/material.dart';
import 'navigator_c/PageA.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returning Data',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转页面'),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageA()),
            );

            print("$result");
          },
        )
      ),
    );
  }
}