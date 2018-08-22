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

class _State extends State<MyApp> {

  List<Step> _steps;
  int _current;


  @override
  void initState() {
    _current = 0;
    _steps = <Step>[
      //filling our _steps list
      new Step(title: new Text('Step 1'), content: new Text('Do Something'), isActive: true),
      new Step(title: new Text('Step 2'), content: new Text('Do Something'), isActive: false),
      new Step(title: new Text('Step 3'), content: new Text('Do Something'), isActive: false), //to disable a step set isActive to false
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if(_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if(_current < 0) _current = 0;
    });
  }

  // this will allow you to jump on steps without clicking continue/cancel each time
  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
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
          //Stepper is a control that organizes steps within a process.
              child: new Stepper(
                steps: _steps,
                type: StepperType.vertical,
                currentStep: _current,
                onStepCancel: _stepCancel,
                onStepContinue: _stepContinue,
                onStepTapped: _stepTap,
              )
          )
      ),
    );
  }
}
