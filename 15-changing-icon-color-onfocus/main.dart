import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Custom Bottom Nav',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Custom Bottom Nav')),
        body: new Container(),
        bottomNavigationBar: new BottomNav(
          navCallback: (i) => print("Navigating to $i"),
        ),
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> navCallback;

  BottomNav({@required this.navCallback, this.initialIndex: 0});

  @override
  _BottomNavState createState() => new _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
    notifyCallback();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      elevation: 8.0,
      child: new Container(
        height: 56.0,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButton(0, Icons.home, "Home"),
            _buildButton(1, Icons.book, "Bookmarks"),
            _buildButton(2, Icons.video_library, "Videos"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, IconData data, String tooltip) {
    return new Flexible(
      flex: 1,
      child: new Tooltip(
        message: tooltip,
        child: new InkWell(
          onTap: () => onButtonTap(index),
          child: new Center(
            child: new Icon(data,
              color: _selected == index ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  onButtonTap(int index) {
    setState(() {
      _selected = index;
    });
    notifyCallback();
  }

  notifyCallback() {
    widget.navCallback(_selected);
  }
}