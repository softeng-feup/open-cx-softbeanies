import 'package:flutter/material.dart';
import 'src/Controller/DataServer.dart';
import 'src/App.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  
  DataServer ds = DataServer();
  // wait for server to load information
  await ds.loadData();
  await DotEnv().load(".env");

  var url = '${DotEnv().env['HOST']}/pois/5defe036192ea44b5b073547';
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  runApp(MVCApp());
}