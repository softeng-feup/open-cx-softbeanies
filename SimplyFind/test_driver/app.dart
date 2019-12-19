import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/LocateText.dart';
import 'package:simplyfind/src/Views/Widgets/OptionButton.dart';

import '../lib/src/App.dart';
import 'package:flutter/material.dart';


void main() {
  // enable flutter driver extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(MVCApp());
}
