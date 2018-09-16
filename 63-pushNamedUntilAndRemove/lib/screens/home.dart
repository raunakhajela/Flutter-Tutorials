import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
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
                new Text('Welcome Home'),
                //pushNamedAndRemoveUntil basically removes the back button e.g in second.dart you won't see any back button
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Second', (Route<dynamic> route) => false);}, child: new Text('Next'),)
              ],
            ),
          )
      ),
    );
  }
}
