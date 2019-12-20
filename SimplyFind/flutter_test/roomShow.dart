import 'package:flutter_test/flutter_test.dart';
import 'package:simplyfind/src/Views/Widgets/OptionButton.dart';

void main(){
    testWidgets('Verify room is being show', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget( OptionButton(title: "title", time: "12:30", speaker: "Maria", room: "B204", onPressed: (){}));

    final roomFinder = find.text('B204');
    expect(roomFinder, findsOneWidget);

  });
}