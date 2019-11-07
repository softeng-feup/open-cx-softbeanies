import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocatePage extends StatefulWidget {
  LocatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LocatePageState createState() => _LocatePageState();
}

class _LocatePageState extends State<LocatePage> {
  var location = new Location();
  LocationData userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:\n" +
                "Latitude: " + userLocation.latitude.toString() +
                " " +
                "Longitude: " + userLocation.longitude.toString() +
                "\nAltitude: " + userLocation.altitude.toString() +
                "\nAccuracy: " + userLocation.accuracy.toString()),
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