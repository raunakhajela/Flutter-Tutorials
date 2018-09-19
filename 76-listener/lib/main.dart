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

    controller = new AnimationController( duration: const Duration(milliseconds: 10000),vsync: this);
    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 100.0, end: 300.0).animate(curve);
    animation.addStatusListener(listener);

    controller.forward();
  }

  //triggering animation based on animation state
  void listener(AnimationStatus status){
    if(status == AnimationStatus.completed) {
      controller.reverse();
    } else if(status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  //we are not animating the logo we are animating the container and logo is simply matching the size
  Widget builder(BuildContext context, Widget child){
    return new Container(
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo()
    );
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
          child: new Center(
            child: new AnimatedBuilder(animation: animation, builder: builder),
          )
      ),
    );
  }
}
