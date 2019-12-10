import 'package:flutter/material.dart';
import '../Controller/DataServer.dart';
import '../Model-POI/Place.dart';
import 'Widgets/GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';

class Search extends StatelessWidget {
  final String destination;
  final List<Place> wantedPlaces;
  Search({
    Key key,
    @required this.wantedPlaces, /*if null the user is seaching by name and not category */
    @required this.destination,
  }) : super(key: key);
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 24, context: ctxt, destination: destination,),
        body: new GoogleMapsWidget(wantedPlaces,DataServer().checkIn),
        ),
    );
  }
}
