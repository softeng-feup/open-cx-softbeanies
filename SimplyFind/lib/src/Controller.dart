import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;


/// The Controller answers & responses to 'the events' while the Model execute 'the rules' and manipulates data.
class Con extends ControllerMVC {
  factory Con() {
    if (_this == null) _this = Con._();
    return _this;
  }
  static Con _this;

  Con._();

  /// Allow for easy access to 'the Controller' throughout the application.
  static Con get con => _this;

  //static final model = Model();


  
}