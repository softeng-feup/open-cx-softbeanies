import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/OptionButton.dart';

void main() {

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

}