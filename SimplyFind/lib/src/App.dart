import 'package:flutter/material.dart';
import 'Views/Search.dart';
import 'Views/Results.dart';
import 'Views/Results2.dart';
import 'Views/Menus/EventsMenu.dart';
import 'Views/Menus/FoodMenu.dart';
import 'Views/Menus/WcMenu.dart';
import 'Views/Menus/OptionsMenu.dart';
import 'Views/HomePage.dart';

class MVCApp extends StatelessWidget {

  static MaterialApp _app;

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

