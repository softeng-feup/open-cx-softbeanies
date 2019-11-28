import 'package:flutter/material.dart';

import 'MockGenerator.dart';
import 'src/GoogleMapsWidget.dart';

class LocateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapsWidget(MockGenerator.LocationLectures, null),
    );
  }
}