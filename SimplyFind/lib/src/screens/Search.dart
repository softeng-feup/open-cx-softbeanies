import 'package:flutter/material.dart';
import 'package:prototype/src/GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 200, context: ctxt),
        body: new GoogleMapsWidget(),
        ),
    );
  }
}
