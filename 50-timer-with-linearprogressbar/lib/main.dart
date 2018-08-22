import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  static Duration duration = new Duration(milliseconds: 100);
  Timer timer;
  double _value = 0.0;
  bool _active = false;

  @override
  void initState() {

    /*the timer created in initState because it needs to exist in the state to
    operate as expected, the state of the timer does not need to be reinitialized
    on every build*/

    timer = new Timer.periodic(duration, _timeout); //Timer.periodic(duration, callback func)
  }

  void _timeout(Timer timer) {
    if(!_active) return;
    setState((){
      _value = _value + 0.01;
      if(_value == 1.0) _active = false;
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new LinearProgressIndicator(value: _value, backgroundColor: Colors.white,),
                ),
                new RaisedButton(onPressed: _onPressed, child: new Text('Start'),)
              ],
            ),
          )
      ),
    );
  }
}
