import 'package:flutter/material.dart';
import 'src/App.dart';
import 'package:prototype/src/database/database.dart';

void main() async {
  var dataBase = new DataBase();
  int number = await dataBase.getCount();
  print("Read number: $number");
  runApp(MVCApp());
}
