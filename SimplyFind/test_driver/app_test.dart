import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'hooks/hook.dart';
import 'steps/exploreStep.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
      FlutterDriverReporter(
        logErrorMessages: true,
        logInfoMessages: true,
        logWarningMessages: true,
      ),
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..hooks = [ hookinuse()]
    ..stepDefinitions = [
      ExploreStepWhen(),
      ThenExploreButton(),
      IAmAt()
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
  // ..buildFlavor = "staging" // uncomment when using build flavor and check android/ios flavor setup see android file android\app\build.gradle
  // ..targetDeviceId = "all" // uncomment to run tests on all connected devices or set specific device target id
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  // ..logFlutterProcessOutput = true // uncomment to see the output from the Flutter process
  // ..flutterBuildTimeout = Duration(minutes: 3) // uncomment to change the default period that flutter is expected to build and start the app within

    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}

