import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class IAmAt extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Menuname) async {
    //Menus have key with there name for easy find in this class
    expect(find.byValueKey(Menuname), true);
  }
  @override
  RegExp get pattern => RegExp(r"I expect the {string} Menu to be display");
}
