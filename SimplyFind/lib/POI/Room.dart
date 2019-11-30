/// TODO Maybe delete because it's not necessary :)
/// Room
class Room {
  /// Number of room
  final String _number;
  /// Floor number of room
  final int _floor;
  /// Constructor
  Room(this._number, this._floor);

  /// Getter member function for [_number]
  /// returns a [String] with the room number
  String get number => _number;

  /// Getter member function for [_floor]
  /// returns a [int] with the room floor
  int get floor => _floor;
}
