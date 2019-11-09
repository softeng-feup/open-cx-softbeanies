import 'package:flutter/material.dart';

import 'GoogleMapsPage.dart';

class LocateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapsPage(),
    );
  }
}