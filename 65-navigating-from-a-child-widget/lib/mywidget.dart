import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Text('Click to navigate'),
          new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Home');}, child: new Text('Click me'),),
        ],
      ),
    );
  }
}