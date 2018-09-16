import 'package:flutter/material.dart';
import 'dart:async';
import 'timedisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => new _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {

  Stopwatch _watch;
  Timer _timer;
  Duration _duration;

  void _onStart() {
    setState(() {
      _watch = new Stopwatch();
      _timer = new Timer.periodic(new Duration(milliseconds: 250), _onTimeOut);
    });
    _watch.start();
  }

  void _onStop() {
    _timer.cancel();
    _watch.stop();
  }

  void _onTimeOut(Timer timer) {
    if(!_watch.isRunning) return;
    setState(() => _duration = _watch.elapsed);
  }

  void _onClear(Duration value) {
    setState(() => _duration = new Duration());
  }


  @override
  void initState() {
    _duration = new Duration();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Center(
        child: new Column(
          children: <Widget>[
            new TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new RaisedButton(onPressed: _onStart, child: new Text('Start'),),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new RaisedButton(onPressed: _onStop, child: new Text('Stop'),),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}