import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clip'),),
      body: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 20,),
            Text('ClipOval'),
            Container(
              height: 150,
              width: 150,
              color: Colors.blue[200],
              child: ClipOval(
                // clipper: MyCustomClipperRect(),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(height: 20,),
            Text('ClipPath'),
            Container(
              height: 150,
              width: 150,
              color: Colors.blue[200],
              child: ClipPath(
                clipper: MyCustomClipperPath(),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(height: 20,),
            Text('ClipRect'),
            Container(
              height: 150,
              width: 150,
              color: Colors.blue[200],
              child: ClipRect(
                // clipper: MyCustomClipperRect(),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(height: 20,),
            Text('ClipRRect'),
            Container(
              height: 150,
              width: 150,
              color: Colors.blue[200],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// class MyCustomClipperRect extends CustomClipper<Rect>{
//   @override
//   Rect getClip(Size size) {
//     var mRect = Rect.fromLTRB(0, 0, 150, 150);
//     return mRect;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return null;
//   }

// }

class MyCustomClipperPath extends CustomClipper<Path> {
  //获取裁剪范围
  @override
  Path getClip(Size size) {
    //左上角为(0,0)
    var path = Path();

    for(int i = 0; i < 6; i++){
      // path.moveTo(8.0, 8.0);//起始点
      // path.lineTo(8.0, 17.0);
      // path.lineTo(17.0, 17.0);
      // path.lineTo(17.0, 8.0);

      for(int j = 0; j < 6; j++){
        path.moveTo(8.0 + i * 25, 8.0 + j * 25);//起始点
        path.lineTo(8.0 + i * 25, 17.0 + j * 25);
        path.lineTo(17.0 + i * 25, 17.0 + j * 25);
        path.lineTo(17.0 + i * 25, 8.0 + j * 25);
      }
    }

    path.close();//
    return path;
  }

  //是否重新裁剪
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}