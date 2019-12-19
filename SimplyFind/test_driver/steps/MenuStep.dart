import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class GivenMenu extends Given1<String> {

  @override
  Future<void> executeStep(String input1) async {
    expect(find.byValueKey(input1), input1);
  }

  @override
  RegExp get pattern => RegExp(r"I am at {string} Menu");
}