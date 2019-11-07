import 'package:location/location.dart';

abstract class PointOfInterest {
  final Location _location;
  final String _info;

  PointOfInterest(this._location, this._info);

  String get info => _info;

  Location get location => _location;
}