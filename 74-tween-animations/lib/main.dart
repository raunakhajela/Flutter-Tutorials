import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin{

  /*
  * animation typically typically have a sequence of numbers or a list of
  * numbers that you are going to modify over time, animation itself is the
  * individual number that changes over time
  *
  * animation controller is the time at which that sequence is changed
  * */
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController( duration: const Duration(milliseconds: 5000),vsync: this);
    animation = new Tween(begin: 0.0, end: 400.0).animate(controller);
    animation.addListener(() {
      setState(() {
        //The state of the animation has changed e.g you want to add different animation effect at number 255
      });
    });

    controller.forward();
  }

  // we need to dispose our controller once the animation is done otherwise it will chew up the battery and seems your app is hung up
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          height: animation.value,
          width: animation.value,
          child: new Center(
            child: new FlutterLogo(size: 300.0,)
          )
      ),
    );
  }
}
