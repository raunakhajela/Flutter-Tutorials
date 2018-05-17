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

  String _value = '';
  void _onClick(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
        backgroundColor: Colors.red,
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: () => _onClick('Button1')),
        new IconButton(icon: new Icon(Icons.people), onPressed: () => _onClick('Button2')),
        new IconButton(icon: new Icon(Icons.map), onPressed: () => _onClick('Button3')),
      ],
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value)
            ],
          ),
        ),
      ),
    );
  }
}
