import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../Model-POI/Place.dart';
import '../../Controller/DataServer.dart';

class GoogleMapsWidget extends StatefulWidget {
  final List<Place> _markers;
  final Place _origin;

  GoogleMapsWidget([this._markers,this._origin]);

  @override
  _GoogleMapsWidgetState createState() =>
      _GoogleMapsWidgetState(_markers,_origin);
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController controller;

  DataServer server = new DataServer();
  LocationData _currentLocation;
  Location _myLocation = new Location();
  final Set<Marker> _markers = new Set();
  final Set<Polyline> _polyLines = new Set();
  Place _destination;
  Place _origin;

  static const LatLng _center = const LatLng(41.177634, -8.595764);

  // ignore: avoid_init_to_null
  _GoogleMapsWidgetState(List<Place> markers, Place origin )  {
    _origin = origin;
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
          position: server.pointsOfInterest[M.poiId].location,
          infoWindow: InfoWindow(
          title: M.name,
          snippet: M.room + " Floor: " +  server.pointsOfInterest[M.poiId].floor.toString(),
            onTap: () {
                  setState(() {
                    makePath(M);
                  });
                },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(215),
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

    List<LatLng> path;
    if(_origin == null)
      path = server.getPathToPOI(LatLng(_currentLocation.latitude,_currentLocation.longitude), M.poiId);
    else {
      path = server.getPathToPOI(server.pointsOfInterest[_origin.poiId].location, M.poiId);
    }

    _markers.clear();
    // add final marker
    _markers.add(Marker(
      markerId: MarkerId(M.hashCode.toString()),
      position: server.pointsOfInterest[M.poiId].location,
      infoWindow: InfoWindow(
        title: M.name,
        snippet: M.room + " Floor: " + server.pointsOfInterest[M.poiId].floor.toString(),
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(215),
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
