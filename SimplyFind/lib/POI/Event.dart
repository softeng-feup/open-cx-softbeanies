import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'PointOfInterest.dart';

class Event extends PointOfInterest {
  final String _name;
  final String _speaker;
  final String _room;
  final String _description;
  final List<String> _tags;
  //final String _date;

  Event(this._name, this._speaker, this._room, this._description, this._tags, LatLng location, int floor) : super(location, floor);

  String get name => _name;

  String get speaker => _speaker;

  String get room => _room;

  String get description => _description;

  List<String> get tags => _tags;

  //String get date => _date;

  String getStringTags() {
    String tagString;

    _tags.forEach(
      (tag) {
        tagString = tagString + ' ' + tag;
      }
    );

    return tagString;
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    // get tags
    var tagsJson = json['tags'];
    List<String> tags = tagsJson != null ? new List.from(tagsJson) : null;

    // get latitude and longitude
    var locationJson = json['location'];
    LatLng location = new LatLng(locationJson['latitude'] as double, locationJson['longitude'] as double);

    print(json['name']);
    print(json['speaker']);
    print(json['room']);
    print(['description']);
    print(tags);
    print(location);
    print(['floor']);

    return Event(
        json['name'] as String,
        json['speaker'] as String,
        json['room'] as String,
        json['description'] as String,
        tags,
        location,
        json['floor'] as int
    );
  }
}

