import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter ListView组件'),),
        body: MyBodyC(),//使用ListView.builder
        // body: MyBodyB(),//循环添加列表元素
        // body: MyBodyA(),//手动添加列表元素
      ),
    );
  }
}
// 使用listview.builder --------------------------------------------------------------------------------
class MyBodyC extends StatelessWidget {

  List list = new List();
  MyBodyC(){
    for(int i = 0; i < 20; i++){
      list.add('我是第$i行数据');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //指定list长度（根据此遍历）
      itemCount: this.list.length,
      //遍历
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(this.list[index]),
        );
      },
    );
  }
}

//循环添加列表元素---------------------------------------------------------------------------------------
class MyBodyB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getData(),
    );
  }
}

List<Widget> getData(){
  List<Widget> list = new List();
  for(int i = 0; i < 20; i++){
    list.add(
      ListTile(
        title: Text('循环添加列表元素$i'),
      ),
    );

  }
  return list;
}
//手动添加列表元素 --------------------------------------------------------------------------------------
class MyBodyA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 15),
      scrollDirection: Axis.vertical,//垂直列表
      children: <Widget>[

        ListTile(
          title: Text('Flutter Image组件'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
          dense:true,
        ),

        ListTile(
          title: Text('Flutter Container 组件'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 Container 官网简介：一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。 其实就是一个容器组件，既然是容器，那么，就一定可以装很多东西，而Container装的东西就是Flutter 其他组件。 参数详解 属性 说明',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),

        ),

        ListTile(
          title: Text('Dart基础特性'),
          subtitle: Text('注：此篇文章对应有一定开发语言基础的伙伴学习研究。这里只摘录出Dart的特性和其它语言不一样的特性（对比java）。 简介：Dart访问控制、Dart公有私有、Dart属性定义、Dart方法、Dart数据类型、Dart运算符、Dart=&gt;函数、Dart箭头函数、Dart 构造',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('Flutter Form表单'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 参数详解 Flutter中的Form是一个容器，里面包含一个或多个TextFormField。TextFormField是表单中使用的Input输入框。 TextFormField的属性基本与TextField相同。 属性 作用',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('Flutter文本框TextField'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 参数详解 TextField同时也使用Text的部分属性： 属性 作用 controller 控制器，如同 Android View id decoration 输入器装饰 keyboardType',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('Flutter Text(Flutter文本显示和样式)'),
          subtitle: Text('目录 参数讲解 代码示例 效果图 附：如何在 Text widget上设置自定义字体 完整代码 参数讲解 Text Widget用于显示简单样式文本，它包含一些控制文本显示样式的一些属性，类似于Android中的TextView 属性 作用 data Text显示的',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('Flutter之初体验'),
          subtitle: Text('Flutter之初体验 . . . 打开AS，新建Flutter项目，如图： Cerate New Flutter Project Flutter Application	创建应用 Flutter Plugin	创建插件 Flutter Package	创建包',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('在Windows上搭建Flutter开发环境'),
          subtitle: Text('在Windows上搭建Flutter开发环境准备工具第一步：安装git第二步：安装Flutter第三步：Android Studio配置错误解决 准备工具 1.操作系统: Windows 7 或更高版本 (64-bit) 2.磁盘空间: 400 MB (不包括Android Studio的磁盘空间',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png',width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('图标在后边得子元素'),
          subtitle: Text('我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle ',maxLines: 2,overflow: TextOverflow.ellipsis,),
          trailing: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png',width: 35,height: 35, ),
        ),

        ListTile(
          title: Text('图标在两边得子元素'),
          subtitle: Text('我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle 我是subtitle ',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png',width: 35,height: 35, ),
          trailing: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png',width: 35,height: 35, ),
        ),

        //  撑满屏   感受下滑动
        ListTile(
          title: Text('撑满屏   感受下滑动1'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),
        ListTile(
          title: Text('撑满屏   感受下滑动2'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),
        ListTile(
          title: Text('撑满屏   感受下滑动3'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),
        ListTile(
          title: Text('撑满屏   感受下滑动4'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),
        ListTile(
          title: Text('撑满屏   感受下滑动5'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Image.network('https://raw.githubusercontent.com/think-ing/flutter_demo/master/images/yuan.png' ,width: 35,height: 35, ),
        ),

      ],
    );
  }
}