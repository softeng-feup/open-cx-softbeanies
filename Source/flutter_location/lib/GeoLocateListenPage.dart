import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocateListenPage extends StatefulWidget {
  @override
  _GeoLocateListenPageState createState() => _GeoLocateListenPageState();
}

class _GeoLocateListenPageState extends State<GeoLocateListenPage> {

  Geolocator geolocator = Geolocator();

  Position userLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geolocator.getPositionStream(LocationOptions(
      accuracy: LocationAccuracy.best, timeInterval: 1000))
    .listen((position) {
      userLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:\n" +
                    "Latitude: " + userLocation.latitude.toString() +
                    " Longitude: " + userLocation.longitude.toString() +
                    "\nAltitude: " + userLocation.altitude.toString() +
                    "\nAccuracy: " + userLocation.accuracy.toString()
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.green,
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    } catch(e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
