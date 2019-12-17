import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/Controller/DataServer.dart';
import 'src/App.dart';


Future main() async {
  await DotEnv().load('.env');

  WidgetsFlutterBinding.ensureInitialized();

  DataServer ds = DataServer();
  // wait for server to load information
  await ds.loadData();

  runApp(MVCApp());
}
