import 'package:flutter/material.dart';
import '../../../data/DataServer.dart';
import '../Search.dart';
import '../AppBarCostumize.dart';
import '../Widgets/ButtonWithImage.dart';

class OptionsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new MyCustomAppBar2(
          height: 14,
          context: context,
          title: "Options",
        ),
        body: SafeArea(
            child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonWithImage(
                  x: 5,
                  y: 5,
                  image: "assets/images/speech.png",
                  onPressed: () {
                    Navigator.pushNamed(context, "/Lectures");
                  },
                  legend: "Lectures"),
              ButtonWithImage(
                  x: 55,
                  y: 5,
                  image: "assets/images/checkIn.png",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            destination: "Check-in", wantedPlaces: [DataServer().checkIn],),
                        ));
                  },
                  legend: "Check In"),
              ButtonWithImage(
                  x: 5,
                  y: 31,
                  image: "assets/images/restaurant.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Food');
                  },
                  legend: "Food"),
              ButtonWithImage(
                  x: 55,
                  y: 31,
                  image: "assets/images/student.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  },
                  legend: "Workshops"),
              ButtonWithImage(
                  x: 5,
                  y: 58,
                  image: "assets/images/wc.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Wc');
                  },
                  legend: "Wc"),
              ButtonWithImage(
                  x: 55,
                  y: 58,
                  image: "assets/images/logout.png",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            destination: "exit", wantedPlaces: DataServer().exits,
                          ),
                        ));
                  },
                  legend: "Exits")
            ],
          ),
        )));
  }
}