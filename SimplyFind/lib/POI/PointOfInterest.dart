import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype/POI/Connection.dart';

class PointOfInterest {
  /// Unique identification number
  final int _pointId;
  /// GPS Coordinates
  final LatLng _location;
  /// Floor number
  final int _floor;
  /// Other POIs accessible through this POI
  List<Connection> _connections;

  /// Constructor
  PointOfInterest(this._pointId, this._location, this._floor);

  /// Getter member function for [_pointId]
  /// returns an [int] indicating [PointOfInterest]'s ID
  int get pointId => _pointId;

  /// Getter member function for [_location]
  /// returns a [LatLng] Object GPS coordinates
  LatLng get location => _location;

  /// Getter member function for [_floor]
  /// returns an [int] indicating POI floor number
  int get floor => _floor;

  /// Getter member function for [_connections]
  /// returns a [List] containing all connections for this POI
  List<Connection> get connections => _connections;

  /// Adds a new [Connection] to the [_connections] list
  /// creating a new instance of [Connection] given its ID
  /// and destination POI ID
  void addConnection(int connectionId, int destPointId) {
    _connections.add(new Connection(connectionId, destPointId));
  }
}
