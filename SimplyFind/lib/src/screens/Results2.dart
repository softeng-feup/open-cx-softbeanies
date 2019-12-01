import 'package:flutter/material.dart';
import 'AppBarCostumize.dart';
import '../GoogleMapsWidget.dart';
import '../../MockGenerator.dart';

class Results2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar2(height: 14, context: ctxt, title: "Map", ),
          body: new GoogleMapsWidget(MockGenerator.Workshops),
        ),
    );
  }
}
