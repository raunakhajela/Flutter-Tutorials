import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp> {

  //Map is basically a type of key/value pair in dart
  Map _countries = new Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);

    if(response.statusCode == 200) {
      setState(() => _countries = JSON.decode(response.body));
      print('Loaded ${_countries.length} countries');
    }
  }


  @override
  Widget build(BuildContext context) {

    //_getData();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Countries', style: new TextStyle(fontWeight: FontWeight.bold),),

                /*Listview diplay rows for different widgets,

                Listview.builder automatically builds its child widgets with a
                template and a list*/

                new Expanded(child: new ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index){
                    String key = _countries.keys.elementAt(index);
                    return new Row(
                      children: <Widget>[
                        new Text('${key} : '),
                        new Text(_countries[key])
                      ],
                    );
                  },

                ))

              ],
            ),
          )
      ),
    );
  }

  @override
  void initState() {
    _getData();
  }
}
