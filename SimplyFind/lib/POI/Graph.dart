import 'dart:collection';

import 'package:prototype/POI/Connection.dart';
import 'package:prototype/POI/PointOfInterest.dart';

/// [PointOfInterest] Graph implementation using a [HashMap] as a Node container
class Graph {
  /// POIs and their connections that make up a Graph
  HashMap<int, PointOfInterest> _pointsOfInterest;

  /// Constructor
  Graph() {
    this._pointsOfInterest = new HashMap<int, PointOfInterest>();
  }

  /// Getter member function for [_pointsOfInterest]
  /// returns a [HashMap] containing [PointOfInterest] Objects
  HashMap<int, PointOfInterest> get pointsOfInterest => _pointsOfInterest;


  /// Adds a new [PointOfInterest] to the [_pointsOfInterest] list
  /// given its ID as key
  void addPointOfInterest(PointOfInterest poi) {
    _pointsOfInterest[poi.id] = poi;
  }

  /// Returns a specific [PointOfInterest] given its ID [pointId],
  /// in case [pointId] does not exist in [_pointsOfInterest] returns null
  PointOfInterest getPointOfInterest(int pointId) {
    return _pointsOfInterest[pointId];
  }

  /// Returns connection list from a specific [PointOfInterest] given
  /// its ID [pointID]
  List<Connection> getConnections(int pointId) {
    return _pointsOfInterest[pointId].connections;
  }

}