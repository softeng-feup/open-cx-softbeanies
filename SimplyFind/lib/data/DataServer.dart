import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
import '../POI/BFS.dart';
import '../POI/Connection.dart';
import '../POI/Graph.dart';
import '../POI/PointOfInterest.dart';

import '../POI/Event.dart';

/// Data Server simulation
class DataServer {
  /// [Map] containing all lectures
  Map<int, Event> _lectures;
  /// [Map] containing all workshops
  Map<int, Event> _workshops;
  /// [Map] containing all POIs
  Map<int, PointOfInterest> _pointsOfInterest;
  /// [Graph] representing FEUP's building
  Graph _poiGraph;
  /// [BFS] to perform searches
  BFS _bfs;
  /// [DataServer] singleton instance
  static final DataServer _dataServerInstance = DataServer._constructor();

  /// Private Constructor
  DataServer._constructor() {
    this._lectures = new Map<int, Event>();
    this._workshops = new Map<int, Event>();
    this._pointsOfInterest = new Map<int, PointOfInterest>();
    this._poiGraph = new Graph();
    this._bfs = new BFS(this._poiGraph);
  }

  /// Factory Constructor for singleton instance
  factory DataServer() {
    return _dataServerInstance;
  }

  /// Getter member function for [_lectures]
  /// returns a [Map] of [Event] Objects
  Map<int, Event> get lectures => _lectures;

  /// Getter member function for [_workshops]
  /// returns a [Map] of [Event] Objects
  Map<int, Event> get workshops => _workshops;

  /// Getter member function for [_pointsOfInterest]
  /// returns a [Map] of [PointOfInterest] Objects
  Map<int, PointOfInterest> get pointsOfInterest => _pointsOfInterest;

  /// Getter member function for [_bfs]
  /// returns a [BFS] Object
  BFS get bfs => _bfs;

  /// Returns a POI given its id
  PointOfInterest getPOI(int pointId) {
    return this._pointsOfInterest[pointId];
  }

  /// Loads entire json files
  Future<void> loadData() async {
    // load event data
    await this.loadLectureData();
    // load POI data (Nodes and Edges)
    await this._loadPOIData();
    await this._loadConnectionData();
    // build graph
    this._buildGraph();
  }

  /// After parsing all the data it is necessary to build [Graph]
  /// for path-finding
  void _buildGraph() {
    _pointsOfInterest.forEach(
      (key, poi) {
        _poiGraph.addPointOfInterest(poi);
      }
    );
  }

  /// Loads json file related to Events and returns json string
  Future<String> _loadLectureDataAsset() async {
    return await rootBundle.loadString('assets/data/lectureDataBase.json');
  }

  /// Creates [Event] objects from json file and stores them in a map
  Future<void> loadLectureData() async {
    String jsonData = await this._loadLectureDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
      (k, v) {
        int actualKey = int.parse(k);
        this._lectures[actualKey] = Event.fromJson(v);
      }
    );
  }

  /// Loads json file related to Events and returns json string
  Future<String> _loadWorkshopDataAsset() async {
    return await rootBundle.loadString('assets/data/lectureDataBase.json');
  }

  /// Creates [Event] objects from json file and stores them in a map
  Future<void> loadWorkshopData() async {
    String jsonData = await this._loadWorkshopDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
            (k, v) {
          int actualKey = int.parse(k);
          this._workshops[actualKey] = Event.fromJson(v);
        }
    );
  }

  /// Loads json file related to POIs and returns json string
  Future<String> _loadPOIDataAsset() async {
    return await rootBundle.loadString('assets/data/auxiliarPOIDataBase.json');
  }

  /// Creates [PointOfInterest] objects from json file and stores them
  /// in [_pointsOfInterest] Map
  Future<void> _loadPOIData() async {
    String jsonData = await this._loadPOIDataAsset();
    Map jsonPOIs = jsonDecode(jsonData);

    jsonPOIs.forEach(
      (k, v) {
        int actualKey = int.parse(k);
        this._pointsOfInterest[actualKey] = PointOfInterest.fromJson(v);
      }
    );
  }

  /// Loads json file related to POI connections and returns json string
  Future<String> _loadConnectionDataAsset() async {
    return await rootBundle.loadString('assets/data/connectionsDataBase.json');
  }

  /// Creates [Connection] objects from json file and adds them to
  /// respective [PointOfInterest] stored in [_pointsOfInterest] Map
  Future<void> _loadConnectionData() async {
    String jsonData = await this._loadConnectionDataAsset();
    Map jsonPOIs = jsonDecode(jsonData);

    int connectionId = 1;
    jsonPOIs.forEach(
      (k, v) {
        int sourcePointId = int.parse(k);
        v.forEach(
          (destPointId) {
            this._pointsOfInterest[sourcePointId].addConnection(connectionId++, destPointId as int);
          }
        );
      }
    );
  }

}
