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

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('LocateText has a title', (WidgetTester tester) async {
  // Create the widget by telling the tester to build it.
    await tester.pumpWidget(LocateText(x: 10, y: 20, title: "Simplifind", size: 20, color:0xFF000000 ));

  // Create the Finders.
    final titleFinder = find.text('Simplifind');

  // Use the `findsOneWidget` matcher provided by flutter_test to verify
  // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);

  });

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Verify title is being show', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    // Create the Finders.
    final titleFinder = find.text('title');
    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Verify room label', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    final roomlabel = find.text("Room");
    expect(roomlabel, findsOneWidget);
  });

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Verify time label', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    //verifies that the widget add the description of the parameter that is inputting
    final timelabel = find.text("Time");
    //Founds label
    expect(timelabel, findsOneWidget);

  });

  testWidgets('Verify room is being show', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    final roomFinder = find.text('B204');
    expect(roomFinder, findsOneWidget);

  });

  testWidgets('Verify speaker is being show', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    final speakerFinder = find.text('Maria');
    expect(speakerFinder, findsOneWidget);

  });

  testWidgets('Verify time is being show correctly', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    // Create the Finders.
    final timeFinder = find.text('12:30');
    expect(timeFinder, findsOneWidget);

  });



  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(MVCApp());
}
