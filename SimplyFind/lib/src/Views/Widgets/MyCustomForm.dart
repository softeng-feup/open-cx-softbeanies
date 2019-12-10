// Define a corresponding State class.
// This class holds the data related to the Form.
import 'package:flutter/material.dart';
import 'package:simplyfind/src/Model-POI/Place.dart';
import '../../Controller/DataServer.dart';
import '../Search.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  final double finalHeight;
  final String location;
  final BuildContext context;
  final String type;
  final Place origin;
  final String destination;
  final List<Place> wantedPlaces;

  MyCustomForm( {
    Key key,
    @required this.finalHeight,
    @required this.location,
    @required this.type,
    @required this.origin, this.destination,
    @required this.context,
    @required this.wantedPlaces }) : super(key: key);

  @override
  MyCustomFormState createState() => MyCustomFormState( finalHeight, location, context, type, origin, destination, wantedPlaces);
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final double finalHeight;
  final String location;
  final BuildContext context;
  final String type;
  final Place origin;
  final String destination;
  final List<Place> wantedPlaces;
  String label;


  MyCustomFormState(this.finalHeight, this.location, this.context, this.type, this.origin, this.destination, this.wantedPlaces);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _handleSubmission(String text) {
    List<Place> newPlaces = new List();

// Not triggered when you press enter on keyboard in  android simulator
// Triggers if you tap on the Done button.
  switch(myController.text.toUpperCase() ) {
    case "WC MALE":
    case "MALE WC":
      newPlaces = DataServer().getRoom("Male WC");
      break;

    case "WC FEMALE":
    case "FEMALE WC":
      newPlaces = DataServer().getRoom("Female WC");
      break;

    case "MACHINES":
    case "VENDING MACHINES":
    case "MACHINE":
      newPlaces = DataServer().vendingMachines;
      break;
    case "COFFEE LOUNGE":
    case "COFFEE BREAK":
      newPlaces = [DataServer().coffeeLounge];
      break;
    case "CHECK-IN":
    case"CHECKIN":
    case"CHECK IN":
      newPlaces = [DataServer().checkIn];
      break;
    case "EXIT":
    case"EXITS":
      newPlaces = DataServer().exits;
      break;
    default: //it is a room our bad written
      newPlaces = DataServer().getRoom(
          myController.text.toUpperCase());
      break;
  }
      if(type == "origin")
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Search(
                    destination: destination,
                    wantedPlaces: wantedPlaces,
                    origin: newPlaces.first,
                    location: myController.text,),
            ));
      else
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Search(
                    destination: myController.text,
                    wantedPlaces: newPlaces,
                    origin: origin,
                    location: location,),
            ));

  }

  @override
  Widget build(BuildContext context) {
    if(type == "origin")
      label = location;
    else label = destination;
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