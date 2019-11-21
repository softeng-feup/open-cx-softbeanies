import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../NavigationPage.dart';
import '../data/DataServer.dart';

class GoogleMapsWidget extends StatefulWidget {
  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController controller;

  DataServer server = new DataServer();

  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polylines = new Set();
  List<LatLng> _points = new List();

  static const LatLng _center = const LatLng(41.177926, -8.597770);
  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _resetMarkers() {
    _markers.clear();
    _points.clear();
    _polylines.clear();
  }

  void _resetPosition() {
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _center, zoom: 19)));
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _points.add(_lastMapPosition);
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: "POI title",
            snippet: "Latitude: " +
                _lastMapPosition.latitude.toStringAsFixed(6) +
                " Longitude: " +
                _lastMapPosition.longitude.toStringAsFixed(6),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationPage()));
            },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(215)));
      _polylines.clear();
      _polylines.add(Polyline(
        polylineId: PolylineId(_lastMapPosition.toString()),
        visible: true,
        points: _points,
        color: Colors.blue,
        jointType: JointType.round,
      ));
    });
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
      polylines: _polylines,
      minMaxZoomPreference: MinMaxZoomPreference(2, 24),
    );
  }

  Widget sideButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 11),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 180,
          width: 40,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              FittedBox(
                child: FloatingActionButton(
                  heroTag: "add_marker",
                  onPressed: _onAddMarkerButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Color.fromRGBO(1, 38, 90, 1),
                  child: const Icon(Icons.add_location, size: 24.0),
                ),
              ),
              SizedBox(height: 10),
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
