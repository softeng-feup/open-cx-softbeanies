import 'package:flutter/material.dart';
import '../../Controller/DataServer.dart';
import '../Widgets/ButtonOrange.dart';
import '../AppBarCostumize.dart';
import '../Search.dart';

class FoodMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new MyCustomAppBar2(
          height: 14,
          context: context,
          title: "Food",
        ),
        body: SafeArea(
            key: Key("Food"),
            child: new Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonOrange(
                  x: 10,
                  y: 17,
                  title: "Machines",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                              destination: "Vending Machines",
                              wantedPlaces: DataServer().vendingMachines,
                              origin: null, location: "my location",)
                        ));
                  }),
              ButtonOrange(
                  x: 10,
                  y: 47,
                  title: "Coffee Lounge",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                              destination: "Coffee Lounge",
                              wantedPlaces: [DataServer().coffeeLounge],
                              origin: null, location: "my location",),
                        ));
                  }),
            ],
          ),
        )));
  }
}
