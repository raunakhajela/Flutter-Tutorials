import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  Second(this.name);
  String name;
  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<Second> {
  _SecondState(this.name);
  String name;

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
                new Text('Hello ${name}'),

                new RaisedButton(onPressed: (){Navigator.of(context).pop();}, child: new Text('Back'),)
              ],
            ),
          )
      ),
    );
  }
}
