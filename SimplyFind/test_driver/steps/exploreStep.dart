import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExploreStepWhen extends When2WithWorld<String, int, FlutterWorld> {
  ExploreStepWhen()
    : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey("Explore");
    for (var i = 0; i < input2; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }
  @override
  RegExp get pattern => RegExp(r"I tap the {String} button {int} times");
}

class ExploreStepThen extends When2WithWorld<String, int, FlutterWorld> {
  ExploreStepThen()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String input1, int input2) async {
    // find the button by key
    final locator = find.byValueKey("location");
    for (var i = 0; i < input2; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }
  @override
  RegExp get pattern => RegExp(r"I expect {String} of the conference to be displayed");
}

class GivenOpenApp extends When2WithWorld<String, int, FlutterWorld> {
  GivenOpenApp()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String input1, int input2) async {
    // find the button by key
    final locator = find.byValueKey("Explore");
    for (var i = 0; i < input2; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I opened the application");

}