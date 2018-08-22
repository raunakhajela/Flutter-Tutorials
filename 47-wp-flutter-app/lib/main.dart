import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

void main() {

  runApp(new MaterialApp(
      home: new MyHome(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      )));
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  // Base URL for your wordpress site
  final String Url = "https://2018.kanpur.wordcamp.org/";

  //api
  final String api = "wp-json/wp/v2/";
  // Empty list for our posts

  //appTitle
  final String appTitle = "WCKANPUR-2018 ";
  List posts;

  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(Url + api + "posts?_embed"),
        headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            new IconButton( // action button
              icon: new Icon(Icons.directions_car),
              onPressed: () {
                print("direction");
              },
            ),
            new IconButton( // action button
              icon: new Icon(Icons.add_alert),
              onPressed: () {
                print("updates coming...");
              },
            ),
          ]
      ),
      body: ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: (posts[index]["_embedded"]["wp:featuredmedia"][0]
                      ["source_url"]),
                    ),

                    new Padding(
                        padding: EdgeInsets.all(8.0),

                        child: new Text(
                          posts[index]["title"]["rendered"],
                          // textAlign: TextAlign.justify,
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                    ),
                    new Padding(
                      padding: EdgeInsets.all(4.0),
                      child: new HtmlView(
                          data: posts[index]["content"]["rendered"]),
                    ),

                  ],
                ),
              )
            ],
          );
        },
      ),

    );
  }
}
