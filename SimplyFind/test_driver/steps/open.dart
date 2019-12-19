import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


class GivenOpenApp extends When1WithWorld<String, FlutterWorld> {
  GivenOpenApp()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String location) async { 
    String searchingKey;
    if(location == "mainMenu")
      searchingKey == "Explore";
    else if(location == "optionsMenu")
      searchingKey == "Categories";
    // find the button by key
    final locator = find.byValueKey(searchingKey);
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    
  }

  @override
  RegExp get pattern => RegExp(r"I opened {string}");

}