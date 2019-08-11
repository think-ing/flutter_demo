import 'package:flutter/material.dart';


class Toast {

  // 透明  默认
  static final int ANIMATED_OPACITY = 0;
  // 平移 下上下   （bottom -> top -> bottom）
  static final int ANIMATED_MOVEMENT_BTB = 1;
  // 平移 左中右   （left -> centre -> right）
  static final int ANIMATED_MOVEMENT_LCR = 2;
  //Tween  demo
  static final int ANIMATED_MOVEMENT_TWEEN = 3;

  static final int LENGTH_SHORT = 0;
  static final int LENGTH_LONG = 1;
  static final int SHORT = 2000;
  static final int LONG = 4000;
  // 默认显示时间
  static int _milliseconds = 2000;
  //toast靠它加到屏幕上
  static OverlayEntry _overlayEntry;
  //toast是否正在showing
  static bool _showing = false;
  //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static DateTime _startedTime;

  static BuildContext _context;
  // 显示文本内容
  static String _content;
  static TextStyle _style;
  // 字体颜色
  static Color _contentColor = Colors.white;
  // 背景颜色
  static Color _backgroundColor = Colors.black54;
  //上边的 边距
  static double _top = -1;
  // 自定义 显示内容
  static Widget _toastWidget;
  // 动画
  static int _animated = 0;
  // 执行动画时间
  static int _millisecondsShow = 200;
  static int _millisecondsHide = 800;

  static Toast makeText({
    @required BuildContext context,
    String content, //文本内容
    Color contentColor,//字体颜色
    int duration = -1, // 显示时间
    Color backgroundColor,//背景
    double top,// 与上边  边距 距离
    int animated, // 动画， 默认透明/不透明
    Widget child,  //自定义的 Toast
  }){
    if(content == null && child == null){
      content = '未知...';
    }
    //清除原有的 Toast
    if(_overlayEntry != null){
      _overlayEntry.remove();
      _overlayEntry = null;
    }

    _context = context;
    _content = content;
    if(contentColor != null){
      _contentColor = contentColor;
    }
    _milliseconds = duration <= LENGTH_SHORT ? SHORT : LONG;
    if(backgroundColor != null){
      _backgroundColor = backgroundColor;
    }
    if(_top < 0){
      _top = MediaQuery.of(context).size.height * 2 / 3;
    }
    _animated = animated;

    if(child != null){
      _toastWidget = child;
    }else{
      _toastWidget = _defaultToastLayout();
    }
    return Toast();
  }

  void show()  {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _startedTime = DateTime.now();
    _showing = false;

    // 显示 Toast
    if(_animated == ANIMATED_MOVEMENT_TWEEN){
      _makeTextShowTween();
    }else if(_animated == ANIMATED_MOVEMENT_LCR){
      _makeTextShowMovementLCR();
    }else if(_animated == ANIMATED_MOVEMENT_BTB){
      _makeTextShowMovementBTB();
    }else{
      _makeTextShowOpacity();
    }
  }

  //显示 文本 Toast  透明渐变
  static void _makeTextShowOpacity() async {
    _showing = true;

    //创建OverlayEntry
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        //top值，可以改变这个值来改变toast在屏幕中的位置
        top: _top,
        child: Container(
          alignment: Alignment.center,//居中
          width: MediaQuery.of(context).size.width,//Container 宽
          child: AnimatedOpacity(
            //目标透明度
            opacity: _showing ? 1.0 : 0.0,
            //执行时间
            duration: _showing ? Duration(milliseconds: _millisecondsShow) : Duration(milliseconds: _millisecondsHide),
            child: _toastWidget,
          ),
        ),
      )
    );
    //显示到屏幕上
    Overlay.of(_context).insert(_overlayEntry);
    //等待两秒
    await Future.delayed(Duration(milliseconds: _milliseconds));

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _milliseconds) {
      _showing = false;
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
      //等待动画执行
      await Future.delayed(Duration(milliseconds: _millisecondsHide));
      if(!_showing){
        _overlayEntry.remove();
        _overlayEntry = null;
      }
    }
  }

  /*
  显示时 初始化在屏幕外（下边） 平移/透明 到显示位置
  隐藏时 平移/透明 到屏幕外（下边）
  */
  // 平移 位置 参数

  //显示 文本 Toast  上下移动
  static void _makeTextShowMovementBTB() async {
    double _x = 0;
    double _y = 1;
    Curve mCurve = MyCurve();

    //创建OverlayEntry
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: _top,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - _top,
          child: AnimatedOpacity(
            opacity: _showing ? 1.0 : 0.0,
            duration: _showing ? Duration(milliseconds: _millisecondsShow) : Duration(milliseconds: _millisecondsHide),
            child: AnimatedAlign(
              // xy坐标 是决定组件再父容器中的位置。 修改坐标即可完成组件平移
              alignment: Alignment(_x,_y),
              duration: _showing ? Duration(milliseconds: _millisecondsShow) : Duration(milliseconds: _millisecondsHide),
              curve: mCurve,
              child: _toastWidget,
            ),
          ),
        ),
      )
    );
    //显示到屏幕上
    Overlay.of(_context).insert(_overlayEntry);
    //等待(先加载 后平移 一个缓冲)
    await Future.delayed(Duration(milliseconds: 50));
    _showing = true;
    //平移到显示位置
    _x = 0;
    _y = -1;
    //重新绘制UI，类似setState
    _overlayEntry.markNeedsBuild();
    //等待
    await Future.delayed(Duration(milliseconds: _milliseconds));
    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _milliseconds) {
      _showing = false;
      mCurve = Curves.linear;
      _x = 0;
      _y = 1;
      _overlayEntry.markNeedsBuild();
      //等待动画执行
      await Future.delayed(Duration(milliseconds: _millisecondsHide));
      if(!_showing){
        _overlayEntry.remove();
        _overlayEntry = null;
      }
    }
  }


  //显示 文本 Toast  左中右移动
  static void _makeTextShowMovementLCR() async {
    double _x = -3.5;
    double _y = -1;
    Curve mCurve = MyCurve();

    //创建OverlayEntry
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: _top,
        child: Container(
          // color:Colors.yellow,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height - _top + 50,
          child: AnimatedOpacity(
            opacity: _showing ? 1.0 : 0.0,
            duration: _showing ? Duration(milliseconds: _millisecondsShow) : Duration(milliseconds: _millisecondsHide),
            child: AnimatedAlign(
              // xy坐标 是决定组件再父容器中的位置。 修改坐标即可完成组件平移
              alignment: Alignment(_x,_y),
              duration: _showing ? Duration(milliseconds: _millisecondsShow) : Duration(milliseconds: _millisecondsHide),
              curve: mCurve,
              child: _toastWidget,
            ),
          ),
        ),
      )
    );
    //显示到屏幕上
    Overlay.of(_context).insert(_overlayEntry);
    //等待(先加载 后平移 一个缓冲)
    await Future.delayed(Duration(milliseconds: 50));
    _showing = true;
    //平移到显示位置
    _x = 0;
    _y = -1;
    //重新绘制UI，类似setState
    _overlayEntry.markNeedsBuild();
    //等待
    await Future.delayed(Duration(milliseconds: _milliseconds));
    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _milliseconds) {
      _showing = false;
      mCurve = Curves.linear;
      _x = 3.5;
      _y = -1;
      _overlayEntry.markNeedsBuild();
      //等待动画执行
      await Future.delayed(Duration(milliseconds: _millisecondsHide));
      if(!_showing){
        _overlayEntry.remove();
        _overlayEntry = null;
      }
    }
  }


  //显示 文本 Toast  Tween 动画
  static void _makeTextShowTween() async {
    _overlayEntry?.remove();
    _overlayEntry = null;

    var overlayState = Overlay.of(_context);
    //透明显示动画控制器
    AnimationController showAnimationController = new AnimationController(vsync: overlayState,duration: Duration(milliseconds: 250),);
    //平移动画控制器
    AnimationController offsetAnimationController = new AnimationController(vsync: overlayState,duration: Duration(milliseconds: 350),);
    //透明隐藏动画控制器
    AnimationController hideAnimationController = new AnimationController(vsync: overlayState,duration: Duration(milliseconds: 250),);

    //透明显示动画
    Animation<double> opacityShow = new Tween(begin: 0.0, end: 1.0).animate(showAnimationController);
    //提供一个曲线，使动画感觉更流畅
    CurvedAnimation ffsetCurvedAnimation = new CurvedAnimation( parent: offsetAnimationController, curve: MyCurve());
    //平移动画
    Animation<double> offsetAnim = new Tween(begin: 50.0, end: 0.0).animate(ffsetCurvedAnimation);
    //透明隐藏动画
    Animation<double> opacityHide = new Tween(begin: 1.0, end: 0.0).animate(hideAnimationController);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context){
        return Positioned(
          //top值，可以改变这个值来改变toast在屏幕中的位置
          top: _top,
          child: Container(
            alignment: Alignment.center,//居中
            width: MediaQuery.of(context).size.width,//Container 宽
            child: AnimatedBuilder(
              animation: opacityShow,
              child: _toastWidget,
              builder: (context, childToBuild) {
                return Opacity(
                  opacity: opacityShow.value,
                  child: AnimatedBuilder(
                    animation: offsetAnim,
                    builder: (context, _) {
                      return Transform.translate(
                        offset: Offset(0, offsetAnim.value),
                        child: AnimatedBuilder(
                          animation: opacityHide,
                          builder: (context, _) {
                            return Opacity(
                              opacity: opacityHide.value,
                              child: childToBuild,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      }
    );
    //显示到屏幕上
    overlayState.insert(_overlayEntry);
    //执行显示动画
    showAnimationController.forward();
    offsetAnimationController.forward();
    //等待
    await Future.delayed(Duration(milliseconds: _milliseconds));

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _milliseconds) {
      //执行隐藏动画
      hideAnimationController.forward();
      //等待动画执行
      await Future.delayed(Duration(milliseconds: 250));
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  //toast绘制
  static _defaultToastLayout() {
    return ConstrainedBox(
      constraints:  BoxConstraints(
        //限制 最大宽度
        maxWidth: MediaQuery.of(_context).size.width / 5 * 4,
      ),
      child: Card(
        color: _backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Text( _content, style: TextStyle( fontSize: 14.0, color: _contentColor, ),maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }

}

//自定义 一个曲线  当然 也可以使用SDK提供的 如： Curves.fastOutSlowIn
class MyCurve extends Curve{
  @override
  double transform(double t) {
    t -= 1.0;
    double  b = t * t * ((2 + 1) * t + 2) + 1.0;
    return b;
  }
}