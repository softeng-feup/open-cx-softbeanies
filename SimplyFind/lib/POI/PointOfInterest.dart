import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class PointOfInterest {
  final LatLng _location;
  final int _floor;

  PointOfInterest(this._location, this._floor);

  LatLng get location => _location;

  int get floor => _floor;
}
