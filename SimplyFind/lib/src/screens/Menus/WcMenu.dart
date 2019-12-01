import 'package:flutter/material.dart';
import '../Widgets/ButtonOrange.dart';

import '../AppBarCostumize.dart';
import '../Search.dart';

class WcMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> buttonTitles = ["Men", "Woman"];
    return Scaffold(
        appBar: new MyCustomAppBar2(
            height: 14, context: context, title: "Wc",),
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    for (int i = 0; i < buttonTitles.length; i++)
                      ButtonOrange(
                        x: 10,
                        y: 18 + i * 27,
                        title: buttonTitles[i],
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            myLocation: 'my location', destination: "Wc " + buttonTitles[i],),
                        ));
                        },
                      )
                  ],
                ))));
  }
}