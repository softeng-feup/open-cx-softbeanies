import 'Widgets/Button.dart';
import 'package:flutter/material.dart';
import 'Widgets/LocateImage.dart';
import 'Widgets/LocateText.dart';
import 'package:permission_handler/permission_handler.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    requestLocationPermission();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(249, 228, 183, 1),
          child: Stack(
            children: <Widget>[
              Button(
                x: 12,
                y: 60,
                title: "Search",
                onPressed: () {
                  Navigator.pushNamed(context, '/Options');
                },
              ),
              Button(
                x: 12,
                y: 75,
                title: "Explore",
                onPressed: () {
                  Navigator.pushNamed(context, '/Search'); // /Search
                },
              ),
              LocateImage(x: 20, y: 20, imageName: "assets/images/start.png"),
              LocateText(x: 12, y: 10, title: "Simplyfind", size: 60.0, color: 0xFF073763,),
            ],
          ),
        )
      )
    );
  }

  Future requestLocationPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
    PermissionStatus permission;
    if((permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts)) == PermissionStatus.denied) {
      print("NO LOCATION ALLOWED. APP WONT FUNCTION PROPERLY.");
    }
  }
}