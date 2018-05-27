import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class SandyShores extends StatelessWidget{

  static String routeName = "sandyShores";

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("You've landed on the Sandy Shores!"),
    );
  }

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      SandyShores.routeName: (BuildContext context) => new SandyShores(),
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(title: 'Flutter Demo Homepage'),
      routes: routes,
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {

    var headerText = new Text('Headers');

    var header = new DrawerHeader(child: headerText);

    var item1Text = new Text('Sandy Shores');

    var item1Icon = new Icon(Icons.settings);

    var item1 = new ListTile(
        title: item1Text, leading: item1Icon, onTap: _onItem1OnTap);

    var children = [header, item1];

    var listView = new ListView(children: children);

    var drawer = new Drawer(child: listView);

    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text('Tabs Demo'),
      ),
      body: new Center(
        child: new Text(''),
      ),
    );

  }

  void _onItem1OnTap() {
    Navigator.popAndPushNamed(context, SandyShores.routeName);
  }
}