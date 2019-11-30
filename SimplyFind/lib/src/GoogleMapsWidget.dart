import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../NavigationPage.dart';
import '../POI/Event.dart';
import '../POI/PointOfInterest.dart';
import '../data/DataServer.dart';

class GoogleMapsWidget extends StatefulWidget {
  final List<Event> _markers;
  final List<PointOfInterest> _points;

  GoogleMapsWidget([this._markers, this._points]);

  @override
  _GoogleMapsWidgetState createState() =>
      _GoogleMapsWidgetState(_markers, _points);
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController controller;

  DataServer server = new DataServer();
  LocationData _currentLocation;
  Location _myLocation = new Location();
  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polyLines = new Set();

  static const LatLng _center = const LatLng(41.177634, -8.595764);
  LatLng _lastMapPosition = _center; // usage is unsure

  _GoogleMapsWidgetState(List<Event> markers, List<PointOfInterest> points) {
    this.makeMarkers(markers);
    this.makePolyline(points);
  }

  @override
  void initState() {
    super.initState();
    _myLocation.onLocationChanged().listen((LocationData location) {
      _currentLocation = location;
      if (_polyLines.isNotEmpty) {
        controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(location.latitude, location.longitude), zoom: 16)));
      }
    });
  }

  void makeMarkers(List<Event> markers) {
    if (markers != null) {
      markers.forEach((M) => {
            _markers.add(Marker(
              markerId: MarkerId(M.hashCode.toString()),
              position: server.getPOI(M.pointId).location,
              infoWindow: InfoWindow(
                title: M.name,
                snippet: M.description + " | " + M.room,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage()));
                },
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(215),
              zIndex: server.getPOI(M.pointId).floor.toDouble(),
            )),
          });
    }
  }

  void makePolyline(List<PointOfInterest> points) {
    if (points != null) {
      List<LatLng> polyPoints = new List();
      points.forEach((P) => {polyPoints.add(P.location)});

      _polyLines.add(Polyline(
        polylineId: PolylineId(points.toString()),
        visible: true,
        points: polyPoints,
        color: Colors.blue,
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
      ));
    }
  }

  /* NOT USED */
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _resetPosition() {
    if (_markers != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _markers.first.position, zoom: 17)));
    } else {
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _center, zoom: 17, bearing: 90)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        mapWidget(),
        crossHair(),
        sideButtons(),
      ],
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        this.controller = controller;
      },
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 17.0,
        bearing: 90,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      indoorViewEnabled: true,
      markers: _markers,
      onCameraMove: _onCameraMove,
      mapType: MapType.terrain,
      polylines: _polyLines,
      minMaxZoomPreference: MinMaxZoomPreference(2, 24),
    );
  }

  Widget sideButtons() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15, right: 11),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 60,
          width: 60,
          child: Column(
            children: <Widget>[
              FittedBox(
                child: FloatingActionButton(
                    heroTag: "home",
                    onPressed: _resetPosition,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Color.fromRGBO(1, 38, 90, 1),
                    child: const Icon(Icons.home, size: 24.0)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget crossHair() {
    return Center(
      child: FittedBox(
        child: Icon(
          Icons.keyboard_arrow_up,
          size: 20,
          color: Color.fromRGBO(1, 38, 90, 1),
        ),
      ),
    );
  }
}
