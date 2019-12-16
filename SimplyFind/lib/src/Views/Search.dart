import 'package:flutter/material.dart';
import '../Model-POI/Place.dart';
import 'Widgets/GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';

class Search extends StatelessWidget {
  final String destination;
  final String location;
  final List<Place> wantedPlaces;
  final Place origin;
  Search({
    Key key,
    @required this.wantedPlaces, /*if null the user is seaching by name and not category */
    @required this.destination,
    @required this.origin,
    @required this.location,
  }) : super(key: key);
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 24, context: ctxt, destination: destination, location: location, wantedPlaces: wantedPlaces, origin: origin,),
        body: new GoogleMapsWidget(wantedPlaces, origin),
        ),
    );
  }
}
