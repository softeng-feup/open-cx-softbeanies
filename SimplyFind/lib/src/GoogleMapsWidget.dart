import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../POI/Place.dart';
import '../data/DataServer.dart';

class GoogleMapsWidget extends StatefulWidget {
  final List<Place> _markers;

  GoogleMapsWidget([this._markers]);

  @override
  _GoogleMapsWidgetState createState() =>
      _GoogleMapsWidgetState(_markers);
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController controller;

  DataServer server = new DataServer();
  LocationData _currentLocation;
  Location _myLocation = new Location();
  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polyLines = new Set();
  Place _destination;

  static const LatLng _center = const LatLng(41.177634, -8.595764);

  _GoogleMapsWidgetState(List<Place> markers) {
    this.makeMarkers(markers);
    if(markers.length == 1) {
      _destination = markers.first;
    }
  }
  
  @override
  void initState() {
    super.initState();
    _myLocation.onLocationChanged().listen((LocationData location) {
      _currentLocation = location;
      if (_polyLines.isNotEmpty) {
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude), zoom: 19)));
        setState(() {
          makePath(_destination);
        });
      }
    });
    if(_destination != null) {
      setState(() {
        makePath(_destination);
      });
    }
  }

   void makeMarkers(List<Place> markers) {
    if(markers != null) {
      markers.forEach((M) => {
        _markers.add(Marker(
          markerId: MarkerId(M.hashCode.toString()),
          position: server.pointsOfInterest[M.pointId].location,
          infoWindow: InfoWindow(
          title: M.name,
          snippet: M.room,
            onTap: () {
                  setState(() {
                    makePath(M);
                  });
                },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(215),
          zIndex: server.pointsOfInterest[M.pointId].floor.toDouble(),
        )),
      });
    }
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

  Future makePath(Place M) async {
    _destination = M;
    if(_currentLocation == null)
      _currentLocation = await _myLocation.getLocation();

    List<LatLng> path = server.getPathToPOI(LatLng(_currentLocation.latitude,_currentLocation.longitude), M.pointId);

    _markers.clear();
    // add final marker
    _markers.add(Marker(
      markerId: MarkerId(M.hashCode.toString()),
      position: server.pointsOfInterest[M.pointId].location,
      infoWindow: InfoWindow(
        title: M.name,
        snippet: M.room,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(215),
      zIndex: server.pointsOfInterest[M.pointId].floor.toDouble(),
    ));

    //make path
    _polyLines.add(Polyline(
      polylineId: PolylineId(M.toString()),
      visible: true,
      points:  path,
      // replace with path finding list
      color: Colors.blue,
      jointType: JointType.round,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    ));
  }
}
