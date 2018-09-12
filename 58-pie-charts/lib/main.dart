import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}

class _State extends State<MyApp> {

  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartdata;


  void _makeData() {
    _chartdata = new List<charts.Series<Sales, int>>();
    _data = <Sales>[
      new Sales(0,100, charts.MaterialPalette.red.shadeDefault),
      new Sales(1,75, charts.MaterialPalette.blue.shadeDefault),
      new Sales(2,25, charts.MaterialPalette.green.shadeDefault),
      new Sales(3,5, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales,_) => sales.color,
      domainFn: (Sales sales,_) => sales.year,
      measureFn: (Sales sales,_) => sales.sales,
    ));
  }


  @override
  void initState() {
    _makeData();
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
            child: new Column(
              children: <Widget>[
                new Text('Sales Data'),
                new Expanded(child: new charts.PieChart<Sales,int>(
                    _chartdata,
                    animate: true,
                    animationDuration: new Duration(seconds: 5)
                )),

              ],
            ),
          )
      ),
    );
  }
}
