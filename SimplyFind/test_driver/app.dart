import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/widgets.dart';

import '../lib/src/App.dart';

void main() {
  // enable flutter driver extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(MVCApp());
}
