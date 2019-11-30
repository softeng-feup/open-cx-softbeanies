import 'package:flutter/material.dart';
import '../../MockGenerator.dart';
import '../GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';


class Search extends StatelessWidget {
  final String myLocation;
  final String destination, backMenu;
  const Search({
    Key key,
    @required this.myLocation,
    @required this.destination, 
    @required this.backMenu
  }) : super(key: key);

  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 24, context: ctxt, myLocation: myLocation, destination: destination, backMenu: backMenu,),
        body: new GoogleMapsWidget(MockGenerator.Workshops),
        ),
    );
  }
}
