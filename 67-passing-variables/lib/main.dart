import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';

/*global state method is the best way of passing data instead
of this example, we can do it like this but often times it breaks
code if you use in some other app, this way isn't bad but it's also not the best*/
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        //All available pages
        '/Home': (BuildContext contrext) => new Home(),
        '/Second': (BuildContext contrext) => new Second(),
      },
      home: new Home(), //first page displayed
    );
  }
}
