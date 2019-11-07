import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  GoogleMapController controller;
  Location location = Location();
  final Set<Marker> _markers = Set();

  Marker marker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((location) async {
      if(marker != null) {
        _markers.remove(marker);
      }
      marker = Marker(
        position: LatLng(location.latitude, location.longitude),
        markerId: MarkerId("MyMarker"),
      );
      _markers.add(marker);
      controller?.moveCamera(CameraUpdate.newLatLng(
          LatLng(location.latitude, location.longitude)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("SimplyFind.me"), backgroundColor: Colors.green),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              this.controller = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(41.177613, -8.5960915),
              zoom: 19,
            ),
            myLocationEnabled: true,
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
