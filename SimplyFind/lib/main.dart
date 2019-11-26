import 'package:flutter/material.dart';
import 'package:prototype/data/DataServer.dart';
import 'src/App.dart';

Future main() async {

  DataServer ds = DataServer();
  // wait for server to load information
  await ds.loadData();

  runApp(MVCApp());
}
