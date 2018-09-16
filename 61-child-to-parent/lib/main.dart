import 'package:flutter/material.dart';
import 'authenticator.dart';

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

  bool _isAuthenticated;

  void _onAuthenticated(bool value) {
    setState(() => _isAuthenticated = value);
  }


  @override
  void initState() {
    _isAuthenticated = false;
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
                /* onAuthenticated is a callback is a method from another class
                that you can access and call to affect some change in the originating class*/
                new Authenticator(onAuthenticated: _onAuthenticated,),
                new Text('Authenticated: ${_isAuthenticated}')
              ],
            ),
          )
      ),
    );
  }
}
