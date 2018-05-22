import 'package:flutter/material.dart';

class FoodMenuSelected extends StatelessWidget {
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
          new Padding(
            padding: new EdgeInsets.all(18.0),
            child: new Column(
              children: <Widget>[
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
            ),
          ),
        ],
      )),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Material(
              elevation: 8.0,
              child: new Padding(
                padding: new EdgeInsets.all(14.0),
                child: new Text('Breakfast Order', textAlign: TextAlign.center, style: new TextStyle(fontSize: 18.0),),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(18.0),
              child: new Column(
                children: <Widget>[
                  new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(8.0)),
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
                            'Coffee && Croissant',
                            style: new TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens breakfast page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  new Padding(padding: new EdgeInsets.all(8.0)),
                  new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(8.0)),
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
                            'Coffee && Breakfast Roll',
                            style: new TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens lunch page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  new Padding(padding: new EdgeInsets.all(8.0)),
                  new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(8.0)),
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
                            'Coffee && Muffin',
                            style: new TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens food page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  new Padding(padding: new EdgeInsets.all(8.0)),
                  new InkWell(
                    child: new Card(
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.all(const Radius.circular(8.0)),
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
                            'Coffee && Drinks',
                            style: new TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens drinks page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
