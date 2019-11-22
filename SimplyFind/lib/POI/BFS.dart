import 'dart:collection';

import 'package:prototype/POI/Connection.dart';
import 'package:prototype/POI/Graph.dart';
import 'package:prototype/POI/PointOfInterest.dart';


/// Breadth-first search implementation
class BFS {
  /// Graph data structure containing all POIs
  final Graph _graph;
  /// a queue to maintain queue of POIs whose
  /// connection list is to be scanned as per normal
  /// BFS algorithm
  Queue<int> queue;
  /// Visited POIs not to be repeated when performing
  /// breadth-first search
  HashMap<int, PointOfInterest> _visitedPoints;
  /// Contains the path from source POI to final POI
  List<int> path;

  /// Constructor
  BFS(this._graph);

  /// Performs a breadth-first search, clear [_visitedPoints] and [queue],
  /// completes [path] with the POIs' IDs from source POI to final POI
  bool performSearch(int sourcePoint, int destinationPoint) {
    // clear queue and visited points
    this.clearVisited();
    queue.clear();
    // add sourcePoint to visited points
    this.addVisited(sourcePoint);
    // queue sourcePoint so it is the next POI to be visited
    queue.add(sourcePoint);
    // main BFS algorithm
    while(queue.isNotEmpty) {
        int nextPoint = queue.first;
        queue.removeFirst();
        List<Connection> nextPointConnections = _graph.getConnections(nextPoint);
        for (Connection connection in nextPointConnections) {
          // complete later ;)
        }
    }

    return false;
  }

  /// Clears [_visitedPoints] so it is ready to
  /// perform a new breadth-first search
  void clearVisited() {
    _visitedPoints.clear();
  }

  /// Detects if a POI was already visited, i.e, is it stored in
  /// [_visitedPoints], returns true if affirmative, false otherwise
  bool isVisited(int pointId) {
    return _visitedPoints.containsKey(pointId);
  }

  /// Adds POI with ID [pointID] to [_visitedPoints] so it cannot
  /// be visited again
  void addVisited(int pointId) {
    _visitedPoints[pointId] = _graph.getPointOfInterest(pointId);
  }


}