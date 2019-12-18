import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/LocateText.dart';

import '../lib/src/App.dart';
import 'package:flutter/material.dart';


void main() {
  // enable flutter driver extension.
  enableFlutterDriverExtension();

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title', (WidgetTester tester) async {
  // Create the widget by telling the tester to build it.
    await tester.pumpWidget(LocateText(x: 10, y: 20, title: "Simplifind", size: 20, color:0xFF000000 ));

  // Create the Finders.
    final titleFinder = find.text('Simplifind');

  // Use the `findsOneWidget` matcher provided by flutter_test to verify
  // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);

  });

  

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(MVCApp());
}
