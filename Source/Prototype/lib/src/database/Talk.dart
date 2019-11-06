
class Talk {
  int _id;
  String _name;
  String _speaker;
  int _roomNumber;

  Talk(this._name, this._roomNumber, this._speaker);

  String get name => _name;
  String get speaker => _speaker;
  int get roomNumber => _roomNumber;
  int get id => _id;

  Map<String, dynamic> toMap() {

    var map = new Map<String, dynamic>();

    map["name"] = _name;
    map["speaker"] = _speaker;
    map["roomNumber"] = _roomNumber;
    map["id"] = _id;

    return map;
  }

  Talk.fromMap(Map<String, dynamic> map) {
    this._name = map["name"];
    this._id = map['id'];
    this._speaker = map['speaker'];
    this._roomNumber = map['roomNumber'];
  }

}




