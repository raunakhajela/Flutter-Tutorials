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

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp> {

  //List is basically an array
  List _pets = ['Dogs', 'Cats', 'Fish', 'Turtle'];


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
                new Text('Pets', style: new TextStyle(fontWeight: FontWeight.bold),),

                /*Listview diplay rows for different widgets,

                Listview.builder automatically builds its child widgets with a
                template and a list*/

                new Expanded(child: new ListView.builder(
                  itemCount: _pets.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Text(_pets.elementAt(index));
                  },

                ))

              ],
            ),
          )
      ),
    );
  }
}
