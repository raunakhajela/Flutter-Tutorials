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

enum Answers{YES,NO,MAYBE}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp>{

  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch(
    await showDialog(
        context: context,
        /*it shows a popup with few options which you can select, for option we
        created enums which we can use with switch statement, in this first switch
        will wait for the user to select the option which it can use with switch cases*/
        child: new SimpleDialog(
          title: new Text('Do you like Flutter?'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
            new SimpleDialogOption(child: new Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
            new SimpleDialogOption(child: new Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
          ],
        )
    )
    ) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
      case Answers.MAYBE:
        _setValue('Maybe');
        break;
    }
  }

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
              new Text(_value),
              new RaisedButton(onPressed: _askUser, child: new Text('Click me'),)
            ],
          ),
        ),
      ),
    );
  }
}
