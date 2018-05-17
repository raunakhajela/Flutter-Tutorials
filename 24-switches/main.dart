import 'package:flutter/material.dart';

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

 bool _value1 = false;
 bool _value2 = false;

 void _onChanged1(bool value) => setState(() => _value1 = value);
 void _onChanged2(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Switch(value: _value1, onChanged: _onChanged1),
              new SwitchListTile(
                  value: _value2,
                  onChanged: _onChanged2,
                  title: new Text('Hello World', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
