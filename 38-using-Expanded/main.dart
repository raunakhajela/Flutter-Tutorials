import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp>{

  /*
  1. Create a directory called images and add your image there
  2. In pubspec.yamp add dependency for using assets
  */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
        backgroundColor: Colors.red,
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Image from assets'),
              new Image.asset('images/flutter.png'),
              new Text('Image from network'),
              //this image was outside the screen so we are using Expanded which will fit the image into the screen
              new Expanded(child: new Image.network('https://static.makeuseof.com/wp-content/uploads/2012/10/flutter-logo.jpg'))
            ],
          ),
        ),
      ),
    );
  }
}
