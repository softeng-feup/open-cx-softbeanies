import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'screens/OptionsMenu.dart';
import 'screens/Search.dart';
import 'screens/Results.dart';
import 'Controler.dart';

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
        '/Lectures': (context) => Lectures(),
        '/Networking': (context) => Networking(),
        '/Food': (context) => Food(),
        '/Workshops': (context) => Workshops(),
        '/Wc': (context) => Wc(),
        '/Exits': (context) => Exits(),
        '/Search': (context) => Search(),
        '/Results': (context) => Results(),
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
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Color(0xFFCAEABC),
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
              Navigator.pushNamed(context, '/Search');
            },
          ),
          LocateImage(x: 20, y: 20, imageName: "images/start.png"),
          LocateText(x: 12, y: 10, title: "Simplyfind", size: 55.0)
        ],
      ),
    )));
  }
}