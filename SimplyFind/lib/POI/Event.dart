import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'PointOfInterest.dart';

class Event extends PointOfInterest {
  final String _name;
  final String _speaker;
  final String _room;
  final String _description;
  final List<String> _tags;

  Event(this._name, this._speaker, this._room, this._description, this._tags, LatLng location) : super(location);

  String get name {
    return this._name;
  }

  String get speaker {
    return this._speaker;
  }

  String get room {
    return this._room;
  }

  String get description{
    return this._description;
  }

  List<String> get tags{
    return this._tags;
  }

  factory Event.fromJson(Map<String, dynamic> json) => _eventFromJson(json);
}

Event _eventFromJson(Map<String, dynamic> json) {

  // get tags
  var tagsJson = json['tags'];
  List<String> tags = tagsJson != null ? new List.from(tagsJson) : null;

  // get latitude and longitude
  var locationJson = json['location'];
  LatLng location = new LatLng(locationJson['latitude'] as double, locationJson['longitude'] as double);

  return new Event(
    json['name'] as String,
    json['speaker'] as String,
    json['room'] as String,
    json['description'] as String,
    tags,
    location,
  );
}