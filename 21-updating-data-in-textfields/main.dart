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

  String _value = '';

  void _onChanged(String value) {
    setState(() => _value = 'Change: ${value}');
  }

  void _onSubmit(String value) {
    setState(() => _value = 'Submit: ${value}');
  }

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
              new Text(_value),
              new TextField(
                decoration: new InputDecoration(
                  labelText: 'Hello',
                  hintText: 'Hint',
                  icon: new Icon(Icons.people)
                ),
                autocorrect: true,
                autofocus: true,

                //displaying number keyboard
                //keyboardType: TextInputType.number,

                //displaying text keyboard
                keyboardType: TextInputType.text,

                onChanged: _onChanged,
                onSubmitted: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
