import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text('Raunak Hajela'),
                  accountEmail: new Text("raunakhajela@gmail.com"),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage("https://wallpaperstudio10.com/static/wpdb/wallpapers/1920x1080/027202.jpg")
                      )
                  )
              ),
              new Padding(padding: new EdgeInsets.all(8.0)),
              new ListTile(
                leading: new Icon(Icons.home),
                title: new Text('Home'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.notifications),
                title: new Text('Notifications'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.shopping_cart),
                title: new Text('My Orders'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.account_box),
                title: new Text('My Account'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.help),
                title: new Text('Help'),
                onTap: () {},
              ),
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.exit_to_app),
                title: new Text('Logout'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                },
              ),
            ],
          )
      ),
      body: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Center(
          child: new Column(

            children: <Widget>[

              new Expanded(
                  child: new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: new Stack(
                        alignment: new Alignment(-0.9, 0.8),
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              'images/breakfast.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Text(
                            'Breakfast',
                            style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () => print('Opens breakfast page'),
                  )
              ),

              new Padding(padding: new EdgeInsets.all(12.0)),

              new Expanded(
                  child: new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: new Stack(
                        alignment: new Alignment(-0.9, 0.8),
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              'images/lunch.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Text(
                            'Lunch',
                            style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () => print('Opens lunch page'),
                  )
              ),

              new Padding(padding: new EdgeInsets.all(12.0)),

              new Expanded(
                  child: new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: new Stack(
                        alignment: new Alignment(-0.9, 0.8),
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              'images/food.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Text(
                            'Food',
                            style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () => print('Opens food page'),
                  )
              ),

              new Padding(padding: new EdgeInsets.all(12.0)),

              new Expanded(
                  child: new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: new Stack(
                        alignment: new Alignment(-0.9, 0.8),
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              'images/drinks.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Text(
                            'Drinks',
                            style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () => print('Opens drinks page'),
                  )
              )

            ],

          ),
        ),
      ),
    );
  }
}