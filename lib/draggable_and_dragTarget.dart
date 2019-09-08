import 'dart:math';
import 'package:flutter/material.dart';
import 'tremble.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  List<MyBean> list;
  MyBean tempMyBean;
  int nowindex = 0;
  //平移动画控制器
  AnimationController mAnimationController;
  int _milliseconds = 200;

  @override
  void initState() {
    super.initState();
    list = List<MyBean>();
    list.add(MyBean(Colors.red, '红色', 'red'));
    list.add(MyBean(Colors.orange, '橙色', 'orange'));
    list.add(MyBean(Colors.yellow, '黄色', 'yellow'));
    list.add(MyBean(Colors.green, '绿色', 'green'));
    list.add(MyBean(Colors.blue, '青色', 'blue'));
    list.add(MyBean(Colors.indigo, '蓝色', 'indigo'));
    list.add(MyBean(Colors.purple, '紫色', 'purple'));
    list.add(MyBean(Colors.black, '黑色', 'black'));
    list.add(MyBean(Colors.white, '白色', 'white'));

    tempMyBean = list[0];

    mAnimationController = AnimationController(duration: Duration(milliseconds: _milliseconds), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //屏幕大小
    Size mSize = MediaQuery.of(context).size;
    //密度
    double mRatio = MediaQuery.of(context).devicePixelRatio;
    //设备像素
    double width = mSize.width * mRatio;
    double height = mSize.height * mRatio;

    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  // 颤动
                  Tremble.widget(
                      child: Center(
                        child: DragTarget(
                            onWillAccept: (MyBean bean) {
                              //颜色不一样  拒绝接收
                              return bean.color == tempMyBean.color;
                            },
                            onAccept: (MyBean bean) async {
                              print("---->已接收");
                              setState(() {
                                tempMyBean = bean;
                              });
                              await Future.delayed(Duration(milliseconds: _milliseconds));
                              setState(() {
                                int i = Random().nextInt(list.length);
                                while (nowindex == i) {
                                  i = Random().nextInt(list.length);
                                }
                                nowindex = i;
                                tempMyBean = list[i];
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                color: tempMyBean.color,
                                child: Text( '${tempMyBean.nameCH} - ${tempMyBean.nameEN}',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: tempMyBean.color == Colors.black ? Colors.white : Colors.black,
                                      letterSpacing: 2
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      mAnimationController: mAnimationController
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFFE3E3E3),
              padding: EdgeInsets.all(5),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Draggable(
                    data: list[index],
                    child: Container(
                      color: list[index].color,
                      child: Center(
                        child: Text('${list[index].nameCH} - ${list[index].nameEN}',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: list[index].color == Colors.black ? Colors.white : Colors.black,
                              letterSpacing: 2
                          ),
                        ),
                      ),
                    ),
                    feedback: Container(
                      height: mSize.width / 3 - 5,
                      width: mSize.width / 3 - 5,
                      alignment: Alignment.center,
                      color: Color(0x00000000),
                      child: Material(
                        color: Color(0xFFE3E3E3),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 100,
                          width: 100,
                          alignment: Alignment.center,
                          color: list[index].color,
                          child: Text('${list[index].nameCH} - ${list[index].nameEN}',
                            style: TextStyle(
                                fontSize: 10,
                                color: list[index].color == Colors.black ? Colors.white : Colors.black,
                                letterSpacing: 2
                            ),
                          ),
                        ),
                      ),
                    ),
                    onDraggableCanceled: (velocity, offset) {
                      print("---->对方拒绝接收");
                      setState(() {
                        if (mAnimationController.status == AnimationStatus.completed) {
                          mAnimationController.reset(); // 重置
                        }
                        mAnimationController.forward(); // 播放
                      });
                    },
                  );
                },
              ),
            )
          ],
        )
    );
  }
}

class MyBean {
  Color color;
  String nameCH;
  String nameEN;
  MyBean(this.color, this.nameCH, this.nameEN);
}
