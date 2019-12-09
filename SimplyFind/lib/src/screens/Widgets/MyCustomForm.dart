// Define a corresponding State class.
// This class holds the data related to the Form.
import 'package:flutter/material.dart';
import 'package:simplyfind/data/DataServer.dart';
import 'package:simplyfind/src/screens/Search.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  final double finalHeight;
  final String label;

  MyCustomForm( {
    Key key,
    @required this.finalHeight,
    @required this.label}) : super(key: key);

  @override
  MyCustomFormState createState() => MyCustomFormState( finalHeight, label);
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final double finalHeight;
  final String label;

  MyCustomFormState(this.finalHeight, this.label);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _handleSubmission(String text) {
// Not triggered when you press enter on keyboard in  android simulator
// Triggers if you tap on the Done button.
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Search(
              destination: myController.text,
              wantedPlaces: DataServer().maleBathrooms),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new TextField(
      maxLines: 1,
      onSubmitted: _handleSubmission,
      controller: myController,
      decoration: new InputDecoration(
        filled: true,
        hintText: label, ///works like a place holder
        fillColor: Colors.white,
        contentPadding: new EdgeInsets.symmetric(vertical: this.finalHeight * 0.1),
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}