import 'Widgets/Button.dart';
import 'package:flutter/material.dart';
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
          key: Key("Main"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(249, 228, 183, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                margin: new EdgeInsets.only(
                top: (10/ 100) * MediaQuery.of(context).size.width
                ),
                child: new Text(
                  "Simplyfind",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: (17.1/ 100) * MediaQuery.of(context).size.width, 
                    color: Color(0xFF073763)),  
                )),
              Image.asset(
                "assets/images/start.png",
                width: 0.6 * MediaQuery.of(context).size.width,
                height: 0.4 * MediaQuery.of(context).size.height,
              ),
              new Container(
                  key: Key("Categories"),
                margin: new EdgeInsets.only(
                  bottom: (2.5/ 100) * MediaQuery.of(context).size.width
                ),
                child: Button(onPressed: () {
                  Navigator.pushNamed(context, '/Options');  // /Options
                } ,title: "Categories",
                )
              ),
              new Container(
                key: Key("Explore"),
                margin: new EdgeInsets.only(
                  bottom: (10/ 100) * MediaQuery.of(context).size.width
                ),
                child:  Button(
                  title: "Explore",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Search');  // /Search
                  } ,
                ),
              )
            ],
          ),
        )
      )
    );
  }

  Future requestLocationPermission() async {
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
    if((await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts)) == PermissionStatus.denied) {
      print("NO LOCATION ALLOWED. APP WONT FUNCTION PROPERLY.");
    }
  }
}