import 'package:flutter/material.dart';

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
                new Text('Sun Shine'),
                new Container(
                  child: new Image(image: new AssetImage('images/smile.png')),
                  padding: new EdgeInsets.all(32.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.orange, width: 2.0),
                      gradient: new RadialGradient(colors: <Color>[Colors.red,Colors.yellow])
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}