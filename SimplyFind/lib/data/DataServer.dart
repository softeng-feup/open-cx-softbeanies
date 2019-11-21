import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../POI/Event.dart';

class DataServer {

  Map<String, Event> _events;

  DataServer() {
    this._events = new Map<String, Event>();
  }

  Future<String> _loadDataAsset() async {
    return await rootBundle.loadString('assets/data/eventDataBase.json');
  }

  /// Creates Event objects from json file and stores them in a map
  Future loadEventData() async {
    String jsonData = await _loadDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
      (k, v) {
        this._events[k] = Event.fromJson(v);
      }
    );
  }

  /// Returns event given its id
  Event getEvent(String eventID) {
    return this._events[eventID];
  }
}