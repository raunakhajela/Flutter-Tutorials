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
  TextEditingController _name;
  TextEditingController _age;
  String _nameDisplay;
  String _ageDisplay;


  @override
  void initState() {
    super.initState();
    _current = 0;
    _name = new TextEditingController();
    _age = new TextEditingController();
  }

  void _stepContinue() {
    setState((){
      _current++;
      if(_current >= _steps.length) _current + _steps.length - 1;
      if(_current == 2) {
        _ageDisplay = _age.text;
        _nameDisplay = _name.text;
      }
    });
  }

  void _stepCancel() {
    setState((){
      _current--;
      if(_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState((){
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
              child: new Stepper(
                type: StepperType.vertical,
                steps: _steps = <Step>[
                  new Step(
                      title: new Text('Step 1'),
                      isActive: true,
                      content: new Column(
                        children: <Widget>[
                          new TextField(controller: _name, decoration: new InputDecoration(labelText: 'Enter your name'),)
                        ],
                      )
                  ),
                  new Step(
                      title: new Text('Step 2'),
                      isActive: true,
                      content: new Column(
                        children: <Widget>[
                          new TextField(
                            controller: _age,
                            decoration: new InputDecoration(labelText: 'Enter your age'),
                            keyboardType: TextInputType.number,
                          )
                        ],
                      )
                  ),
                  new Step(
                      title: new Text('Step 3'),
                      content: new Column(
                        children: <Widget>[
                          new Text('You Entered:'),
                          new Text('Your name is ${_nameDisplay}:'),
                          new Text('Your age is ${_ageDisplay}:'),
                        ],
                      )
                  ),
                ],
                currentStep: _current,
                onStepTapped: _stepTap,
                onStepContinue: _stepContinue,
                onStepCancel: _stepCancel,
              )
          )
      ),
    );
  }
}
