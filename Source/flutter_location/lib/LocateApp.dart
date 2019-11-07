import 'package:flutter/material.dart';

import 'GeoLocateListenPage.dart';
import 'GoogleMapsPage.dart';
import 'LocateListenPage.dart';
import 'LocatePage.dart';

class LocateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GoogleMapsPage(),
    );
  }
}