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

  void _showBottom(){
    showModalBottomSheet<void>(
        context: context,
        /*bottom sheet is like a drawer that pops off where you can put any
      controls you want, it is used typically for user notifications*/
        //builder lets your code generate the code
        builder: (BuildContext context){
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Some info here', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
              ],
            ),
          );
        }
    );
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
              new Text('Add widgets here'),
              new RaisedButton(onPressed: _showBottom, child: new Text('Click me'),)
            ],
          ),
        ),
      ),
    );
  }
}
