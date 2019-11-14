import 'package:flutter/material.dart';
import 'AppBarCostumize.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 250, context: ctxt),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}
