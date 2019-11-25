import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:prototype/POI/Connection.dart';
import 'package:prototype/POI/PointOfInterest.dart';

import '../POI/Event.dart';

class DataServer {

  Map<String, Event> _events;

  Map<int, PointOfInterest> _pointsOfInterest;
  
  DataServer() {
    this._events = new Map<String, Event>();
  }

  Future<String> _loadEventDataAsset() async {
    return await rootBundle.loadString('assets/data/eventDataBase.json');
  }

  /// Creates [Event] objects from json file and stores them in a map
  Future loadEventData() async {
    String jsonData = await _loadEventDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
      (k, v) {
        int actualKey = int.parse(k); // TODO: Test this please, change Map's key to int type
        this._events[k] = Event.fromJson(v);
      }
    );
  }

  /// Returns event given its id
  Event getEvent(String eventID) {
    return this._events[eventID];
  }

  /// Creates [PointOfInterest] objects from json file and stores them in a List
  Future loadPOIData() async {
    String jsonData = await rootBundle.loadString('assets/data/auxiliarPOIDataBase.json');
    Map jsonPOIs = jsonDecode(jsonData);

    jsonPOIs.forEach(
      (k, v) {
        int actualKey = int.parse(k);
        this._pointsOfInterest[actualKey] = PointOfInterest.fromJson(v);
      }
    );
  }

  /// Creates [Connection] objects from json file and stores them in a List
  Future loadConnectionData() async {
    String jsonData = await rootBundle.loadString('assets/data/auxiliarPOIDataBase.json');
    Map jsonPOIs = jsonDecode(jsonData);

    int connectionId = 1;
    jsonPOIs.forEach(
      (k, v) {
        int sourcePointId = int.parse(k);

        List<int> destPoints = v;
        destPoints.forEach(
          (destPointId) {
            this._pointsOfInterest[sourcePointId].addConnection(connectionId++, destPointId);
          }
        );
      }
    );
  }
}
