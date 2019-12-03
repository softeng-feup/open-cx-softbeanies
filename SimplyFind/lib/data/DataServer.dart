import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../POI/BFS.dart';
import '../POI/Connection.dart';
import '../POI/Graph.dart';
import '../POI/Place.dart';
import '../POI/PointOfInterest.dart';

import '../POI/Event.dart';

/// Data Server simulation
class DataServer {
  /// [List] containing all lectures
  List<Event> _lectures;
  /// [List] containing all workshops
  List<Event> _workshops;
  /// [List] containing all male bathrooms
  List<Place> _maleBathrooms;
  /// [List] containing all female bathrooms
  List<Place> _femaleBathrooms;
  /// [List] containing all male bathrooms
  List<Place> _vendingMachines;
  /// [List] containing all male bathrooms
  List<Place> _exits;
  /// [Place] representative of Coffee Lounge location
  Place _coffeeLounge;
  /// [Place] representative of check-in location
  Place _checkIn;
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
    // Events
    this._lectures = new List<Event>();
    this._workshops = new List<Event>();
    // places
    this._maleBathrooms = new List<Place>();
    this._femaleBathrooms = new List<Place>();
    this._vendingMachines = new List<Place>();
    this._exits = new List<Place>();
    // specific places
    this._coffeeLounge = new Place("Coffee Lounge", "Coffee Lounge", 14);
    this._checkIn = new Place("Check In", "InfoDesk", 2);
    // Graph and POI
    this._pointsOfInterest = new Map<int, PointOfInterest>();
    this._poiGraph = new Graph();
    this._bfs = new BFS(this._poiGraph);
  }

  /// Factory Constructor for singleton instance
  factory DataServer() {
    return _dataServerInstance;
  }

  /// Getter member function for [_lectures]
  /// returns a [List] of [Event] Objects
  List<Event> get lectures => _lectures;

  /// Getter member function for [_workshops]
  /// returns a [List] of [Event] Objects
  List<Event> get workshops => _workshops;

  /// Getter member function for [_maleBathrooms]
  /// returns a [List] of [Place] Objects
  List<Place> get maleBathrooms => _maleBathrooms;

  /// Getter member function for [_femaleBathrooms]
  /// returns a [List] of [Place] Objects
  List<Place> get femaleBathrooms => _femaleBathrooms;

  /// Getter member function for [_vendingMachines]
  /// returns a [List] of [Place] Objects
  List<Place> get vendingMachines => _vendingMachines;

  /// Getter member function for [_exits]
  /// returns a [List] of [Place] Objects
  List<Place> get exits => _exits;

  /// Getter member function for [_coffeeLounge]
  /// returns a [Place] Object containing information about Coffee Lounge location
  Place get coffeeLounge => _coffeeLounge;

  /// Getter member function for [_checkIn]
  /// returns a [Place] Object containing information about Check-in location
  Place get checkIn => _checkIn;

  ///TEMPORARY GETTER
  ///gets every Place in database
  List<Place> get everything => [_lectures,_workshops,_maleBathrooms,_femaleBathrooms,_vendingMachines,_exits,[_coffeeLounge,_checkIn]].expand((x) => x).toList();

  /// Getter member function for [_pointsOfInterest]
  /// returns a [Map] of [PointOfInterest] Objects
  Map<int, PointOfInterest> get pointsOfInterest => _pointsOfInterest;

  /// Getter member function for [_bfs]
  /// returns a [BFS] Object
  BFS get bfs => _bfs;

  /// return path from event given
  List<LatLng> getPathToPOI(LatLng userPosition, int destinationPoint) {
    List<LatLng> coordsPath = new List<LatLng>();
    // user position is the first element to be displayed on list
    coordsPath.add(userPosition);
    // get closest POI from userPosition and find path from closest POI to destination POI
    PointOfInterest closestPOI = this._poiGraph.getClosestPointOfInterest(userPosition);
    if (!this._bfs.execute(closestPOI.id, destinationPoint)) {
      // search failed, return list with user position and destination point
      coordsPath.add(this._pointsOfInterest[destinationPoint].location);
      return coordsPath;
    }
    // get POI path
    List<int> path = this._bfs.path.reversed.toList();
    // build LatLng path from POI's id
    path.forEach(
      (pointId) {
        coordsPath.add(this._pointsOfInterest[pointId].location);
      }
    );
    return coordsPath;
  }

  /// Loads entire json files
  Future<void> loadData() async {
    // load event data
    await this._loadLectureData();
    await this._loadWorkshopData();
    // load place data
    await this._loadBathroomData();
    await this._loadVendingMachinesData();
    await this._loadExitsData();
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

  /// Loads json file related to lectures and returns json string
  Future<String> _loadLectureDataAsset() async {
    return await rootBundle.loadString('assets/data/lectureDataBase.json');
  }

  /// Creates [Event] objects from json file related to lectures and stores them in a map
  Future<void> _loadLectureData() async {
    String jsonData = await this._loadLectureDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
            (k, v) {
          this._lectures.add(Event.fromJson(v));
        }
    );
  }

  /// Loads json file related to workshops and returns json string
  Future<String> _loadWorkshopDataAsset() async {
    return await rootBundle.loadString('assets/data/workshopDataBase.json');
  }

  /// Creates [Event] objects from json file related to workshops and stores them in a map
  Future<void> _loadWorkshopData() async {
    String jsonData = await this._loadWorkshopDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
            (k, v) {
          this._workshops.add(Event.fromJson(v));
        }
    );
  }

  /// Loads json file related to male bathrooms and returns json string
  Future<String> _loadMaleBathroomDataAsset() async {
    return await rootBundle.loadString('assets/data/maleBathroomDataBase.json');
  }

  /// Loads json file related to female bathrooms and returns json string
  Future<String> _loadFemaleBathroomDataAsset() async {
    return await rootBundle.loadString('assets/data/femaleBathroomDataBase.json');
  }

  /// Creates [Place] objects from json file and stores them in a map
  Future<void> _loadBathroomData() async {
    String jsonData = await this._loadMaleBathroomDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
       (k, v) {
        this._maleBathrooms.add(Place.fromJson(v));
       }
    );

    String jsonData2 = await this._loadFemaleBathroomDataAsset();
    Map jsonEvents2 = jsonDecode(jsonData2);

    jsonEvents2.forEach(
            (k, v) {
          this._femaleBathrooms.add(Place.fromJson(v));
        }
    );
  }

  /// Loads json file related to Vending Machines and returns json string
  Future<String> _loadVendingMachinesDataAsset() async {
    return await rootBundle.loadString('assets/data/vendingMachinesDataBase.json');
  }

  /// Creates [Place] objects from json file and stores them in a map
  Future<void> _loadVendingMachinesData() async {
    String jsonData = await this._loadVendingMachinesDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
            (k, v) {
          this._vendingMachines.add(Place.fromJson(v));
        }
    );
  }

  /// Loads json file related to Vending Machines and returns json string
  Future<String> _loadExitsDataAsset() async {
    return await rootBundle.loadString('assets/data/exitsDataBase.json');
  }

  /// Creates [Place] objects from json file and stores them in a map
  Future<void> _loadExitsData() async {
    String jsonData = await this._loadExitsDataAsset();
    Map jsonEvents = jsonDecode(jsonData);

    jsonEvents.forEach(
            (k, v) {
          this._exits.add(Place.fromJson(v));
        }
    );
  }
}