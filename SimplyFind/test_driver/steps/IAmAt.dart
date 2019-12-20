import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class IAmAt extends Given1<String> {
  IAmAt()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));
  @override
  Future<void> executeStep(String input1) async {
    expect(find.byValueKey(input1), input1);
  }

  @override
  RegExp get pattern => RegExp(r"I am at {string} Menu");
}