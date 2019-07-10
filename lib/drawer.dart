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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Drawer'),),
      drawer: Drawer(
        // child:Container(
        //   alignment: Alignment.center,
        //   child: Text('我是Drawer',style: TextStyle(fontSize: 30),),
        // ),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('wo shi Email'),
              accountName: Text('我是Drawer'),
              onDetailsPressed: () {},
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/ac.jpg"),
              ),
            ),
            ListTile(
              title: Text('ListTile1'),
              subtitle: Text('ListSubtitle1',maxLines: 2,overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(child: Text("1")),
              onTap: (){Navigator.pop(context);},
            ),
            Divider(),//分割线
            ListTile(
              title: Text('ListTile2'),
              subtitle: Text('ListSubtitle2',maxLines: 2,overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(child: Text("2")),
              onTap: (){Navigator.pop(context);},
            ),
            Divider(),//分割线
            ListTile(
              title: Text('ListTile3'),
              subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
              leading: CircleAvatar(child: Text("3")),
              onTap: (){Navigator.pop(context);},
            ),
            Divider(),//分割线
            new AboutListTile(
              icon: new CircleAvatar(child: new Text("4")),
              child: new Text("AboutListTile"),
              applicationName: "AppName",
              applicationVersion: "1.0.1",
              applicationIcon: Image.asset(
                'images/bc.jpg',
                width: 55.0,
                height: 55.0,
                fit: BoxFit.cover,
              ),
              applicationLegalese: "applicationLegalese",
              aboutBoxChildren: <Widget>[
                new Text("第一条..."),
                new Text("第二条...")
              ],
            ),
            Divider(),//分割线
          ],
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Text('data')
      ),
    );
  }
}