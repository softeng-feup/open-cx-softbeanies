import 'package:flutter/material.dart';
import 'package:simplyfind/POI/Place.dart';
import 'package:simplyfind/POI/PointOfInterest.dart';
import '../../MockGenerator.dart';
import '../GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';

class Search extends StatelessWidget {
  final String destination;
  final List<Place> wantedPlaces;
  Search({
    Key key,
    @required this.wantedPlaces, /*if null the user is seaching by name and not category */
    @required this.destination,
  }) : super(key: key);
  List<PointOfInterest> points;
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 24, context: ctxt, destination: destination,),
        body: new GoogleMapsWidget(MockGenerator.Workshops),
        ),
    );
  }
}
