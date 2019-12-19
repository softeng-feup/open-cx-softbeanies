import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class seeMapStep extends Then1WithWorld<String, FlutterWorld> {
  seeMapStep()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 5));

  @override
  Future<void> executeStep(String key) async {
    //Menus have key with there name for easy find in this class

    final keyfound = find.byValueKey(key);
      await world.driver.waitFor(keyfound, timeout: timeout);

    final locator = find.byValueKey("location"); //maps menu allways have the container with the key location
    String text = await world.driver.getText(locator, timeout: Duration(seconds: 2));

    expect(text, "my location"); //the value of the field with key location must be "my location"
  }
  @override
  RegExp get pattern => RegExp(r"I expect to see the {string}");
}
