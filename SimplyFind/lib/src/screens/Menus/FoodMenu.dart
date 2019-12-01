import 'package:flutter/material.dart';
import '../Widgets/ButtonOrange.dart';
import '../AppBarCostumize.dart';
import '../Search.dart';

class FoodMenu extends StatelessWidget {
  List<String> buttonTitles = ["Bar", "Grill", "Machines", "Coffe break"];
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
              for (int i = 0; i < buttonTitles.length; i++)
                ButtonOrange(
                    x: 10,
                    y: 4 + i * 20,
                    title: buttonTitles[i],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            myLocation: 'my location', destination: buttonTitles[i],),
                        ));
                    }),
            ],
          ),
        )));
  }
}