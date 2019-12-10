import 'package:flutter/material.dart';
import 'src/Controller/DataServer.dart';
import 'src/App.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataServer ds = DataServer();
  // wait for server to load information
  await ds.loadData();

  runApp(MVCApp());
}
