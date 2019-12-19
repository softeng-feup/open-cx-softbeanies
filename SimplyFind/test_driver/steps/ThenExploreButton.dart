import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ThenExploreButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String destination) async {
    expect(find.byValueKey(destination), "starting point");
  }
  @override
  RegExp get pattern => RegExp(r"I expect to find a {string} form to put the wanted destination");
}
