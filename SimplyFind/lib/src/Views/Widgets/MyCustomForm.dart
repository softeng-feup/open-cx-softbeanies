// Define a corresponding State class.
// This class holds the data related to the Form.
import 'package:flutter/material.dart';
import '../../Controller/DataServer.dart';
import '../Search.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  final double finalHeight;
  final String label;
  final BuildContext context;

  MyCustomForm( {
    Key key,
    @required this.finalHeight,
    @required this.label,
    @required this.context }) : super(key: key);

  @override
  MyCustomFormState createState() => MyCustomFormState( finalHeight, label, context);
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final double finalHeight;
  final String label;
  final BuildContext context;

  MyCustomFormState(this.finalHeight, this.label, this.context);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _handleSubmission(String text) {
// Not triggered when you press enter on keyboard in  android simulator
// Triggers if you tap on the Done button.
  switch(myController.text.toUpperCase() ) {
    case "WC MALE":
    case "MALE WC":
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Search(
                    destination: myController.text,
                    wantedPlaces: DataServer().maleBathrooms),
          ));
      break;

    case "WC FEMALE":
    case "FEMALE WC":
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Search(
                    destination: myController.text,
                    wantedPlaces: DataServer().femaleBathrooms),
          ));
      break;

    case "MACHINES":
    case "VENDING MACHINES":
    case "MACHINE":
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Search(
                    destination: "Vending Machines",
                    wantedPlaces: DataServer().vendingMachines),
          ));
      break;
    case "COFFEE LOUNGE":case "COFFEE BREAK":
    Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Search(
                destination: "Coffee Lounge",
                wantedPlaces: [DataServer().coffeeLounge]),
          ));
      break;
    case "CHECK-IN":case"CHECKIN":case"CHECK IN":
    Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Search(
              destination: "Check-in", wantedPlaces: [DataServer().checkIn],),
          ));
      break;
    case "EXIT":case"EXITS":
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Search(
              destination: "exit", wantedPlaces: DataServer().exits,
            ),
          ));
      break;
    default:
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Search(
              destination: myController.text.toUpperCase(), wantedPlaces: DataServer().getRoom(myController.text.toUpperCase()),
            ),
          ));
      break;
  }
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