import 'package:flutter/material.dart';
import '../../Controller/DataServer.dart';
import '../Widgets/ButtonOrange.dart';

import '../AppBarCostumize.dart';
import '../Search.dart';

class WcMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new MyCustomAppBar2(
          height: 14,
          context: context,
          title: "Wc",
        ),
        body: SafeArea(
            child: Container(
                key: Key("Wc"),
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    ButtonOrange(
                      x: 10,
                      y: 18,
                      title: "Men",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                  destination: "Wc Men",
                                  wantedPlaces: DataServer().maleBathrooms,
                                  origin: null,  location: "my location",),
                            ));
                      },
                    ),
                    ButtonOrange(
                      x: 10,
                      y: 45,
                      title: "Women",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                  destination: "Wc Women",
                                  wantedPlaces: DataServer().femaleBathrooms,
                                  origin: null, location: "my location",),
                            ));
                      },
                    )
                  ],
                ))));
  }
}
