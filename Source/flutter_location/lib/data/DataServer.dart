import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_location/POI/Event.dart';

class DataServer {

  final String _address;
  Map<String, Event> _events;

  DataServer(this._address) {
    this._events = new Map<String, Event>();
  }

  Future<String> _loadDataAsset() async {
    return await rootBundle.loadString(this._address);
  }

  Future loadData() async {
    String jsonData = await _loadDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
      (k, v) {
        this._events[k] = Event.fromJson(v);
      }
    );

    print(this._events);
  }

  Event getEvent(String eventID) {
    return this._events[eventID];
  }
}