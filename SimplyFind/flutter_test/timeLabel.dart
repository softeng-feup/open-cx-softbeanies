import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/OptionButton.dart';

void main() {
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
}