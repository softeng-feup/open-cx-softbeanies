class Place {
  /// Name of the event
  final String _name;
    /// Name of the room in which the event will take place
  final String _room;
    /// Integer indicating a POI in the map
  final int _pointId;

  Place(this._name, this._room, this._pointId);

  /// Getter member function for [_name]
  /// return a [String] with the name of the event
  String get name => _name;
  
  /// Getter member function for [_room]
  /// return a [String] with the name of the room for the event
  String get room => _room;
  
  /// Getter member function for [_pointId]
  /// return an [int] indicating the location of the Event
  int get pointId => _pointId;
}