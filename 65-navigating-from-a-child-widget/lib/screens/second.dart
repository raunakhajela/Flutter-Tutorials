import 'package:flutter/material.dart';
import '../mywidget.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Second Page'),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Third');}, child: new Text('Next'),),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Home');}, child: new Text('Back'),),
                /*
                Notice how MyWidget() also contains the route history even though it came
                from a widget.
                Doesn't matter where it is in your child hierarchy.
                It's going to use the same routing.
                Because everything extends from this widget right here my app
                everything's a part of this material app.
                */
                new MyWidget(),
              ],
            ),
          )
      ),
    );
  }
}