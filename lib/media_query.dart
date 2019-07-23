import 'package:flutter/material.dart';
import 'dart:ui';

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
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: Center(
        child: AnimatedContainer(
          height: sideLength,
          width: sideLength,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Material(
            // color: Colors.yellow,
            child: CircularProgressIndicator(),
            // child: InkWell(
            //   onTap: () {
            //     setState(() {
            //       sideLength == 50 ? sideLength = 100 : sideLength = 50;
            //     });
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}




// class HomePage extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     //屏幕大小
//     Size mSize = MediaQuery.of(context).size;
//     //密度
//     double mRatio = MediaQuery.of(context).devicePixelRatio;
//     //设备像素
//     double width = mSize.width * mRatio;
//     double height = mSize.height * mRatio;

//     // 上下边距 （主要用于 刘海  和  内置导航键）
//     double topPadding = MediaQuery.of(context).padding.top;
//     double bottomPadding = MediaQuery.of(context).padding.bottom;

//     double textScaleFactor = MediaQuery.of(context).textScaleFactor;
//     Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
//     EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;
//     EdgeInsets padding = MediaQuery.of(context).padding;
//     bool alwaysUse24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;
//     bool accessibleNavigation = MediaQuery.of(context).accessibleNavigation;
//     bool invertColors = MediaQuery.of(context).invertColors;
//     bool disableAnimations = MediaQuery.of(context).disableAnimations;
//     bool boldText = MediaQuery.of(context).boldText;



//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter MediaQuery屏幕信息'),),
//       body: Container(
//         alignment: Alignment.topLeft,
//         height: 500,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment:CrossAxisAlignment.center,
//           children: <Widget>[
//             Text('屏幕大小: $mSize dp'),
//             Text('像素密度: $mRatio'),

//             Text('设备像素: ${width.ceil()} x ${height.ceil()}'),

//             Text('上边刘海: ${topPadding.ceil()}'),

//             Text('下边导航: ${bottomPadding.ceil()}'),


//             Text('textScaleFactor: $textScaleFactor'),
//             Text('platformBrightness: $platformBrightness'),
//             Text('viewInsets: $viewInsets'),
//             Text('padding: $padding'),
//             Text('alwaysUse24HourFormat: $alwaysUse24HourFormat'),
//             Text('accessibleNavigation: $accessibleNavigation'),
//             Text('invertColors: $invertColors'),
//             Text('disableAnimations: $disableAnimations'),
//             Text('boldText: $boldText'),


//             // Divider(
//             //   height: 50,
//             //   indent: 100,
//             //   color: Colors.red,
//             // ),
// GestureDetector(),

//           ],
//         )
//       ),
//     );
//   }
// }