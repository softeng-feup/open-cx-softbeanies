import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'PointOfInterest.dart';

class Event extends PointOfInterest {
  /// Name of the event
  final String _name;
  /// Name of the speaker responsible
  final String _speaker;
  /// Name of the room in which the event will take place
  final String _room;
  /// Small description about the content of the event
  final String _description;
  /// List containing the tags related to the event
  final List<String> _tags;
  //final String _date;

  /// Constructor
  Event(this._name, this._speaker, this._room, this._description, this._tags, int pointId, LatLng location, int floor) : super(pointId, location, floor);

  /// Getter member function for [_name]
  /// return a [String] with the name of the event
  String get name => _name;

  /// Getter member function for [_speaker]
  /// return a [String] with the name of the speaker for the event
  String get speaker => _speaker;

  /// Getter member function for [_room]
  /// return a [String] with the name of the room for the event
  String get room => _room;

  /// Getter member function for [_description]
  /// return a [String] with the description for the event
  String get description => _description;

  /// Getter member function for [_tags]
  /// return a [List] of [String]s with the tags of the event
  List<String> get tags => _tags;

  //String get date => _date;

  /// Getter member function
  /// TODO: is this necessary??
  String getStringTags() {
    String tagString;

    _tags.forEach(
      (tag) {
        tagString = tagString + ' ' + tag;
      }
    );

    return tagString;
  }

  /// Factory constructor
  /// Returns an [Event] object given a json style [Map]
  factory Event.fromJson(Map<String, dynamic> json) {
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
        json['pointId'] as int,
        location,
        json['floor'] as int
    );
  }
}

