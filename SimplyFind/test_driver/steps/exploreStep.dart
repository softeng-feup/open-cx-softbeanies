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

class GivenMenu extends Given1<String> {

  @override
  Future<void> executeStep(String input1) async {
    expect(find.byValueKey(input1), input1);
  }

  @override
  RegExp get pattern => RegExp(r"I am at {string} Menu");
}

class ThenExploreButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String destination) async {
    expect(find.byValueKey(destination), "starting point");
  }
  @override
  RegExp get pattern => RegExp(r"I expect to find a {string} form to put the wanted destination");
}

class IAmAt extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Menuname) async {
    //Menus have key with there name for easy find in this class
    expect(find.byValueKey(Menuname), true);
  }
  @override
  RegExp get pattern => RegExp(r"I expect the {string} Menu to be display");
}
