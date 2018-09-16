import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  Authenticator({Key key, this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() => new _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {

  _AuthenticatorState({Key key, this.onAuthenticated});

  TextEditingController _user;
  TextEditingController _pass;
  /*ValueChanged is a function signature of a Callable Class, a class that has a call() method
  You can use instances of that class like functions
  Dart has callable classes,and custom setters/getters so you can run an
  entire function everytime you access a value or everytime you write somewhere*/
  final ValueChanged<bool> onAuthenticated;

  void _onPressed() {
    if(_user.text != 'user' || _pass.text != '1234') {
      onAuthenticated(false); // ValueChanged onAuthenticated is a function signature that's why this line is working like a function
      onAuthenticated(true);
    }
  }


  @override
  void initState() {
    _pass = new TextEditingController();
    _user = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _user,
              decoration: new InputDecoration(labelText: 'Username'),
            ),
            new TextField(
              controller: _pass,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new RaisedButton(onPressed: _onPressed, child: new Text('Login'),),)
          ],
        ),
      ),
    );

  }
}
