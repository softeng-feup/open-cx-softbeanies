import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExploreStepWhen extends When2WithWorld<String, int, FlutterWorld> {
  ExploreStepWhen()
    : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey(input1);
    for (var i = 0; i < input2; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }
  @override
  RegExp get pattern => RegExp(r"I tap the {String} button {int} time");
}

class ExploreStepThen extends When1WithWorld<String, FlutterWorld> {
  ExploreStepThen()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String input1) async {
    // find the button by key
    final locator = find.byValueKey("location");
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    
  }
  @override
  RegExp get pattern => RegExp(r"I expect to find a {string} form to put the wanted destination");
}

