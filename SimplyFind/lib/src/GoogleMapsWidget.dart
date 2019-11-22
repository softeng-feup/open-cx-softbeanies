import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../NavigationPage.dart';
import '../POI/Event.dart';
import '../POI/PointOfInterest.dart';
import '../data/DataServer.dart';

class GoogleMapsWidget extends StatefulWidget {
  final List<Event> markers;
  final List<PointOfInterest> points;

  GoogleMapsWidget(this.markers, this.points);

  @override
  _GoogleMapsWidgetState createState() =>
      _GoogleMapsWidgetState(markers, points);
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController controller;

  DataServer server = new DataServer();

  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polyLines = new Set();

  static const LatLng _center = const LatLng(41.177926, -8.597770);
  LatLng _lastMapPosition = _center; // usage is unsure

  _GoogleMapsWidgetState(List<Event> markers, List<PointOfInterest> points) {
    this.makeMarkers(markers);
    this.makePolyline(points);
  }

  void makeMarkers(List<Event> markers) {
    markers.forEach((M) => {
          _markers.add(Marker(
              markerId: MarkerId(M.hashCode.toString()),
              position: M.location,
              infoWindow: InfoWindow(
                title: M.name,
                snippet: //"Latitude: " + M.location.latitude.toStringAsFixed(2) + "\nLongitude: " + M.location.longitude.toStringAsFixed(2) +
                    M.description,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage()));
                },
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(215)))
        });
  }

  void makePolyline(List<PointOfInterest> points) {
    List<LatLng> polyPoints = new List();
    points.forEach((P) => {polyPoints.add(P.location)});

    _polyLines.add(Polyline(
      polylineId: PolylineId(_lastMapPosition.toString()),
      visible: true,
      points: polyPoints,
      color: Colors.blue,
      jointType: JointType.round,
    ));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _resetMarkers() {
    _markers.clear();
    _polyLines.clear();
  }

  void _resetPosition() {
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _center, zoom: 19)));
  }

  @override
  Widget build(BuildContext context) {
    server.loadEventData();
    //print(server.getEvent('1'));
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
        zoom: 19.0,
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
      padding: EdgeInsets.only(top: 15, right: 11),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 140,
          width: 40,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              FittedBox(
                child: FloatingActionButton(
                    heroTag: "reset",
                    onPressed: _resetMarkers,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Color.fromRGBO(1, 38, 90, 1),
                    child: const Icon(Icons.restore, size: 24.0)),
              ),
              SizedBox(height: 10),
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
