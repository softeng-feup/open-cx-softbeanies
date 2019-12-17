import 'Place.dart';

/// Event
class Event extends Place {
  /// Name of the speaker responsible
  final String _speaker;
  /// Date of the event (day-month-year)
  final String _date;
  /// Hour of the begin of the event
  final String _hour;
  /// Small description about the content of the event
  final String _description;
  /// List containing the tags related to the event
  final List<String> _tags;

  /// Constructor
  Event(_name, this._speaker, _room, this._date, this._hour, _pointId, this._description, this._tags) :
  super(_name, _room, _pointId);

  /// Getter member function for [_speaker]
  /// return a [String] with the name of the speaker for the event
  String get speaker => _speaker;

  /// Getter member function for [_date]
  /// return a [String] with the date of the event
  String get date => _date;

  /// Getter member function for [_hour]
  /// return a [String] with the date of the event
  String get hour => _hour;

  /// Getter member function for [_description]
  /// return a [String] with the description for the event
  String get description => _description;

  /// Getter member function for [_tags]
  /// return a [List] of [String]s with the tags of the event
  List<String> get tags => _tags;

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

    return Event(
      json['name'] as String,
      json['speaker'] as String,
      json['room'] as String,
      json['date'] as String,
      json['hour'] as String,
      json['pointId'] as int,
      json['description'] as String,
      tags
    );
  }
}

