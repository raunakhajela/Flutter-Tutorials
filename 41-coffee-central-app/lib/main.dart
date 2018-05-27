import 'package:flutter/material.dart';
import 'package:coffee_central_app/screens/home.dart';
import 'package:coffee_central_app/screens/foodmenu_selected.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/FoodMenuSelected': (BuildContext context) => new FoodMenuSelected(),
      },
      home: new Home(),
    );
  }
}