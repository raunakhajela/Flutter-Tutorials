import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  List<LatLng> points;
  MapController mapController;
  List<Marker> markers;


  @override
  void initState() {
    super.initState();

    mapController = new MapController();
    points = new List<LatLng>();
    points.add(new LatLng(41.8781, -87.6298));
    points.add(new LatLng(42.3314, -83.0458));
    points.add(new LatLng(42.7325, -84.5555));

    markers = new List<Marker>();
    for(int i = 0; i < points.length; i++) {
      markers.add(new Marker(
        width: 80.0,
        height: 80.0,
        point: points.elementAt(i),
        builder: (ctx) => new Icon(Icons.pin_drop,color: Colors.red,),
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new FlutterMap(
                    mapController: mapController,
                    options: new MapOptions(
                      center: new LatLng(41.8781, -87.6298),
                      zoom: 10.0
                    ),
                    //openmap uses layers so we have to provide it otherwise you get errors
                    //the caching for open map is not same as google map but its good for open src projects
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a','b','c'],
                      ),
                      new MarkerLayerOptions(markers: markers),
                      new PolylineLayerOptions(
                          polylines: [
                            new Polyline(
                                points: points,
                                strokeWidth: 4.0,
                                color: Colors.purple
                            )
                          ]
                      )
                    ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
