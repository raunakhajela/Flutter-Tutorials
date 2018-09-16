import 'package:flutter/material.dart';
import 'second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _name;


  @override
  void initState() {
    _name = new TextEditingController();
  }

  void _onPressed() {

   // Navigator.of(context).pushNamed('/Second');
    Navigator.push(context, new MaterialPageRoute(
        builder: (BuildContext context) => new Second(_name.text),
    ));
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
              new TextField(
                controller: _name,
                decoration: new InputDecoration(labelText: 'Enter your name'),
              ),
              new RaisedButton(onPressed: _onPressed, child: new Text('Next'),)
            ],
          ),
        )
      ),
    );
  }
}
