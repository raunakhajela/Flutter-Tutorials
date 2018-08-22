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

//creating a class which holds the data of expansion panel list
class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {

  List<MyItem> _items = new List<MyItem>();


  @override
  void initState() {
    for(int i = 0 ; i< 10; i++) {
      _items.add(new MyItem(
          false,
          'Item ${i}',
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Hello World'),
          )
      ));
    }
  }

  //ExpansionPanel is a individual panel where as expansion list contains data
  ExpansionPanel _createitem(MyItem item) {
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new ListView(
          children: <Widget>[
            new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createitem).toList(),
            )
          ],
        ),
      ),
    );
  }


}
