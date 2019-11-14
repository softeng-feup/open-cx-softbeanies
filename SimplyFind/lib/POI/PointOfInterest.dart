import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class PointOfInterest {
  final LatLng _location;

  PointOfInterest(this._location);

  LatLng get location => _location;

}