import 'package:flutter/material.dart';
import '../../MockGenerator.dart';
import '../GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';


class Search extends StatelessWidget {

  //Events related to a search must be obtained here and sent on GoogleMapsWidget()

  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 24, context: ctxt),
        body: new GoogleMapsWidget(MockGenerator.Workshops),
        ),
    );
  }
}
