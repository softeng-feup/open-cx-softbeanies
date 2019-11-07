import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocateListenPage extends StatefulWidget {
  @override
  _LocateListenPageState createState() => _LocateListenPageState();
}

class _LocateListenPageState extends State<LocateListenPage> {

  Location location = Location();

  LocationData currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
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
            currentLocation == null
              ? CircularProgressIndicator()
              : Text("Location:\n" +
                "Latitude: " + currentLocation.latitude.toString() +
                " " +
                "Longitude: " + currentLocation.longitude.toString() +
                "\nAltitude: " + currentLocation.altitude.toString() +
                "\nAccuracy: " + currentLocation.accuracy.toString()),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      currentLocation = value;
                    });
                  });
                },
                color: Colors.green,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async{
    var currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
