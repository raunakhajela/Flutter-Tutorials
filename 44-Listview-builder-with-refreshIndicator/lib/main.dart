import 'dart:async';
import 'package:tutorial/models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

final ThemeData _themeData = new ThemeData(
  primaryColor: Colors.blue,
);

/// Root MaterialApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _routes = <String, WidgetBuilder>{
      "/todos": (BuildContext context) => new TodosPage(),
      // add another page,
    };
    return new MaterialApp(
      title: "My App",
      theme: _themeData,
      home: new HomePage(),
      routes: _routes,
    );
  }
}

/// place: "/"
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Home Page")),
      body: new RaisedButton(
        child: new Text("My Todos"),
        onPressed: _onPressed,
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/todos");
  }
}


/// place: "/todos"
class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => new _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Todos")),
      body: new RefreshIndicator(
        child: new ListView.builder(itemBuilder: _itemBuilder),
        onRefresh: _onRefresh,
      ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Todo todo = getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index) {
    return new Todo(false, "Todo $index");
  }
}

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Text("-"),
      title: new Text(widget.todo.name),
      onTap: _onTap,
    );
  }

  void _onTap() {
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => new TodoPage(todo: widget.todo),
    );
    Navigator.of(context).push(route);
  }
}

/// place: "/todos/todo"
class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoPageState createState() => new _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[
      new Text("finished: " + widget.todo.finished.toString()),
      new Text("name: " + widget.todo.name),
    ];
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Todo")),
      body: new Column(
        children: _children,
      ),
    );
  }
}