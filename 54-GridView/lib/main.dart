import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Area {
  int index;
  String name;
  Color color;
  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {

  int _location;
  List<Area> _areas;


  @override
  void initState() {
    _areas = new List<Area>();
    for(int i = 0; i< 16; i++) {
      _areas.add(new Area(index: i, name: 'Area ${i}'));
    }

    var rng = new Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    //GridTile is individual square that will go to gridview
    return new GridTile(
        child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new RaisedButton(
            onPressed: () => _onPressed(index),
            color: _areas[index].color,
            child: new Text(_areas[index].name, textAlign: TextAlign.center),

          ),
        )
    );
  }

  void _onPressed(int index) {
    setState((){
      if(index == _location) {
        // if index==random location we found the treasure
        _areas[index].color = Colors.green;
        //You won
      } else {
        _areas[index].color = Colors.red;
      }
    });
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
              child: new GridView.count(
                crossAxisCount: 4, //no of tiles you want to show in a row
                children: new List<Widget>.generate(16, _generate),
              )
          )
      ),
    );
  }
}
