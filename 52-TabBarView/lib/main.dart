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

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {

  TabController _controller;
  List<Choice> _items = const <Choice>[
    const Choice(title: 'CAR', icon: Icons.directions_car),
    const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    const Choice(title: 'BOAT', icon: Icons.directions_boat),
    const Choice(title: 'BUS', icon: Icons.directions_bus),
    const Choice(title: 'TRAIN', icon: Icons.directions_railway),
    const Choice(title: 'WALK', icon: Icons.directions_walk),
  ];


  @override
  void initState() {
    _controller = new TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Name here'),
          bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(controller: _controller,),
                )
            ),

          ),
        ),
        body: new TabBarView(
          controller: _controller,
          children: _items.map((Choice item){
            return new Container(
              padding: new EdgeInsets.all(25.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(item.title),
                    new Icon(item.icon, size: 120.0,)
                  ],
                ),
              ),

            );
          }).toList(),
        )
    );
  }
}
