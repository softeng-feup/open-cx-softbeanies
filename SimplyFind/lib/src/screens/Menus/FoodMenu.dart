import 'package:flutter/material.dart';
import '../../../data/DataServer.dart';
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
            child: new Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonOrange(
                  x: 10,
                  y: 4,
                  title: "Vending Machines",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                              destination: "Vending Machines",
                              wantedPlaces: DataServer().vendingMachines),
                        ));
                  }),
              ButtonOrange(
                  x: 10,
                  y: 24,
                  title: "Coffee Lounge",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                              destination: "Coffee Lounge",
                              wantedPlaces: DataServer().vendingMachines),
                        ));
                  }),
            ],
          ),
        )));
  }
}
