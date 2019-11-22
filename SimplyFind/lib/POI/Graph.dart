import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype/POI/PointOfInterest.dart';

class Graph {
  /// POIs and their connections that make up a Graph
  List<PointOfInterest> _pointsOfInterest;

  /// Constructor
  Graph();

  /// Adds a new [PointOfInterest] to the [_pointsOfInterest] list
  /// creating a new instance of [PointOfInterest] given its ID,
  /// [LatLng] location and floor
  void addPointOfInterest(int pointId, LatLng location, int floor) {
    _pointsOfInterest.add(new PointOfInterest(pointId, location, floor));
  }
}