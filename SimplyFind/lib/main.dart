import 'package:flutter/material.dart';
import 'data/DataServer.dart';
import 'src/App.dart';

Future main() async {

  DataServer ds = DataServer();
  // wait for server to load information
  await ds.loadData();

  runApp(MVCApp());
}
