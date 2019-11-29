import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:permission_handler/permission_handler.dart';
import 'screens/Search.dart';
import 'screens/Results.dart';
import 'screens/Results2.dart';
import 'Controller.dart';
import 'screens/Menus/EventsMenu.dart';
import 'screens/Widgets/LocateImage.dart';
import 'screens/Widgets/LocateText.dart';
import 'screens/Menus/FoodMenu.dart';
import 'screens/Menus/WcMenu.dart';
import 'screens/Menus/OptionsMenu.dart';
import 'screens/Widgets/Button.dart';

class MVCApp extends AppMVC {
  MVCApp({Key key}) : super(con: _controller, key: key);

  /// An external reference to the Controller if you wish. -gp
  static final Con _controller = Con();

  static MaterialApp _app;

  static String get title => _app.title.toString();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _app = MaterialApp(
      title: 'SimplyFind Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFACDF87),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/Options': (context) => OptionsMenu(),
        '/Lectures': (context) => EventsMenu(title: "Lectures"),
        '/Food': (context) => FoodMenu(),
        '/Workshops': (context) => EventsMenu(title: "Workshops"),
        '/Wc': (context) => WcMenu(),
        '/Search': (context) => Search( myLocation: 'my location', destination: 'Choose Destination', backMenu: '/',),
        '/Results': (context) => Results(),
        '/Results2': (context) => Results2(),
      },
    );
    return _app;
  }

}

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
              LocateText(x: 15, y: 10, title: "Simplyfind", size: 60.0),
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