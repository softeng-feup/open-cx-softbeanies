import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/OptionButton.dart';

void main(){
  testWidgets('Verify time is being show correctly', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    // Create the Finders.
    final timeFinder = find.text('12:30');
    expect(timeFinder, findsOneWidget);

  });

}