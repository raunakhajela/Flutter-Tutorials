import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyTextInput()
  ));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => new MyTextInputState();
}
  
  class MyTextInputState extends State<MyTextInput>{

    String result = "";

    @override
    Widget build(BuildContext context){
      return new Scaffold(
        appBar: new AppBar(title: new Text("Input Text"), backgroundColor: Colors.deepOrange),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Type in here"
                  ),
                  //onChanged is called whenever we add or delete something on Text Field
                  onChanged: (String str){
                    setState((){
                      result = str;
                    });
                  }
                ),
                //displaying input text
                new Text(result)
                ]
              )
          )
        )
      );
    }
}