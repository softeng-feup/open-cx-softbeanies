import 'package:flutter/material.dart';
import 'AppBarCostumize.dart';

class Results2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar2(height: 200, context: ctxt),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}
