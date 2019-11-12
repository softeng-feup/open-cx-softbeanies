import 'package:flutter_location/POI/PointOfInterest.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event extends PointOfInterest {
  final String _name;
  final String _speaker;
  final String _room;
  final String _description;
  final List<String> _tags;

  Event(this._name, this._speaker, this._room, this._description, this._tags, LatLng location) : super(location);

  factory Event.fromJson(Map<String, dynamic> json) => _eventFromJson(json);
}

Event _eventFromJson(Map<String, dynamic> json) {

  // get tags
  var tagsJson = json['tags'];
  List<String> tags = tagsJson != null ? new List.from(tagsJson) : null;

  // get latitude and longitude
  var locationJson = json['location'];
  LatLng location = new LatLng(locationJson['latitude'] as double, locationJson['longitude'] as double);

  return Event(
    json['name'] as String,
    json['speaker'] as String,
    json['room'] as String,
    json['description'] as String,
    tags,
    location,
  );
}