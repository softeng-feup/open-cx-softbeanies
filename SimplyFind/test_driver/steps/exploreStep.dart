import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


class ExploreStepWhen extends When2WithWorld<String, int, FlutterWorld> {
  ExploreStepWhen()
    : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String buttonName, int numberOfTaps) async {
    // find the button by key
    final locator = find.byValueKey('SearchButton');
    // tap numberOfTaps times
    for (var i = 0; i < numberOfTaps; i++) {
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
  Future<void> executeStep(String widgetName, int _) async {
    find.byValueKey(widgetName);
  }

  @override
  RegExp get pattern => RegExp(r"I expect {String} of the conference to be displayed");
}
