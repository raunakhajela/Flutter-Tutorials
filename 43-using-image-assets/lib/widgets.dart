import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Text('This works'));
  }
}

class MyExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/explore.png');
    var image = new Image(image: assetsImage, width: 48.0, height: 48.0);
    return new Container(child: image);
  }
}
