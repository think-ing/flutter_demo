import 'package:flutter/material.dart';
import 'dart:math' as math;

class Tremble{
  //提供一个曲线，使动画感觉更流畅
  static CurvedAnimation offsetCurvedAnimation;
  //平移动画
  static Animation<double> offsetAnim;

  static widget({Center child, AnimationController mAnimationController}) {
    offsetCurvedAnimation = new CurvedAnimation( parent: mAnimationController, curve: MyCurve());
    offsetAnim = new Tween(begin: -1.0, end: 1.0).animate(offsetCurvedAnimation)
      ..addListener((){
        // print('object');
      })
      ..addStatusListener((status){
        // print("$status"); // 打印状态
        // if (status == AnimationStatus.completed) {
        //   mAnimationController.reset(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
        // }
        // else if (status == AnimationStatus.dismissed) {
        //   mAnimationController.forward(); // 重新从头到尾播放
        // }
      });

    return Container(
      alignment: Alignment.center,
      child: Container(
          child: AnimatedBuilder(
            animation: offsetAnim,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(offsetAnim.value,0),
                child: child,
              );
            },
          )
      ),
    );
  }
}
// class Tremble extends StatefulWidget {
//   Widget _child;
//   _TrembleState _trembleState;
//   Tremble(this._child): _trembleState = _TrembleState();


//   // @override
//   // _TrembleState createState() => _TrembleState();
//   @override
//   _TrembleState createState(){
//     return _trembleState;
//   }



//   void play() {_trembleState.play();}
// }

// class _TrembleState extends State<Tremble> with SingleTickerProviderStateMixin{
//   //平移动画控制器
//   AnimationController mAnimationController;
//   //提供一个曲线，使动画感觉更流畅
//   CurvedAnimation offsetCurvedAnimation;
//   //平移动画
//   Animation<double> offsetAnim;

//   int _milliseconds = 200;

//   @override
//   void initState() {
//     super.initState();
//     mAnimationController = AnimationController(duration: Duration(milliseconds: _milliseconds), vsync: this);
//     offsetCurvedAnimation = new CurvedAnimation( parent: mAnimationController, curve: MyCurve());
//     offsetAnim = new Tween(begin: -1.0, end: 1.0).animate(offsetCurvedAnimation)
//     ..addListener((){
//       // print('object');
//     })
//     ..addStatusListener((status){
//       // print("$status"); // 打印状态
//       // if (status == AnimationStatus.completed) {
//       //   mAnimationController.reset(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
//       // }
//       // else if (status == AnimationStatus.dismissed) {
//       //   mAnimationController.forward(); // 重新从头到尾播放
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         alignment: Alignment.center,
//         child: Container(
//               child: AnimatedBuilder(
//                 animation: offsetAnim,
//                 builder: (context, _) {
//                   return Transform.translate(
//                     offset: Offset(offsetAnim.value,0),
//                     child: widget._child,
//                     // child: Container(
//                     //   height: 200,
//                     //   width: 200,
//                     //   color: Colors.red,
//                     // ),
//                   );
//                 },
//               )
//             ),
//         // child: Column(
//         //   children: <Widget>[
//         //     RaisedButton(
//         //       child: Text('data'),
//         //       onPressed: (){
//         //         if (mAnimationController.status == AnimationStatus.completed) {
//         //           mAnimationController.reset(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
//         //         }
//         //         mAnimationController.forward();
//         //       },
//         //     ),
//         //     SizedBox(height: 100,),

//         //   ],
//         // ),
//       ),
//     );
//   }


//   void play(){
//     // if (mAnimationController.status == AnimationStatus.completed) {
//     //   mAnimationController.reset(); // 动画结束时，反转从尾到头播放，结束的状态是 dismissed
//     // }
//     mAnimationController.forward(); // 重新从头到尾播放
//   }
// }



//自定义 一个曲线  当然 也可以使用SDK提供的 如： Curves.fastOutSlowIn    抖动
class MyCurve extends Curve{

  const MyCurve([this.period = 0.4]);//抖动频率
  final double period;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    t = (2.0 * t - 1.0) * -1;
    double d = -1 * math.pow(2.0, 5.0 * t) * math.sin((t - s) * (math.pi * 2.0) / period);
    return d;
  }
}