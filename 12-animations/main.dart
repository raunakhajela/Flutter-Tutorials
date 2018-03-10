import 'package:flutter/material.dart';

import './loader.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new Home()
    )
  );
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Center(
        child: new Loader()
      ),
    );
  }
}