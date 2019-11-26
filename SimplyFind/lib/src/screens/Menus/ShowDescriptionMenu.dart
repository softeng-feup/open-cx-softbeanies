import 'package:flutter/material.dart';
import 'package:prototype/POI/Event.dart';
import 'package:prototype/src/screens/Search.dart';

import '../AppBarCostumize.dart';

class ShowDescriptionMenu extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String backMenu;
  final Event event;
  ShowDescriptionMenu(
      {this.context,
      @required this.title,
      @required this.backMenu,
      @required this.event});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      "Speaker :  " + event.speaker,
      "Room :  " + event.room,
      "Date :  " + event.date,
      "Hour :  " + event.hour
    ];

    return Scaffold(
        appBar: new MyCustomAppBar2(
            height: 14, context: context, title: title, backMenu: backMenu),
        body: SafeArea(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              width: (5 / 100) * MediaQuery.of(context).size.width,
              height: (4 / 100) * MediaQuery.of(context).size.height,
            ),
            new Container(
                width: (90 / 100) * MediaQuery.of(context).size.width,
                height: (60 / 100) * MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                  left: (1 / 100) * MediaQuery.of(context).size.width,
                  right: (1 / 100) * MediaQuery.of(context).size.width,
                ),
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(249, 228, 183, 1),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))),
                child: Stack(children: <Widget>[
                  new Column(children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                        top: (5 / 100) * MediaQuery.of(context).size.height,
                      ),
                      child: new Text(
                        event.name,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 20.0, color: Color(0xFF073763)),
                      ),
                    ),
                    for (int i = 0; i < text.length; i++)
                      new Container(
                        padding: EdgeInsets.only(
                          top: (3 / 100) * MediaQuery.of(context).size.height,
                        ),
                        child: new Text(
                          text[i],
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 17.0, color: Color(0xFF000000)),
                        ),
                      ),
                    new Container(
                      padding: EdgeInsets.only(
                        top: (3 / 100) * MediaQuery.of(context).size.height,
                      ),
                      child: new Text(
                        "Description: ",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 16.0, color: Color(0xFF000000)),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(
                        top: (2 / 100) * MediaQuery.of(context).size.height,
                        left: (1 / 100) * MediaQuery.of(context).size.width,
                        right: (1 / 100) * MediaQuery.of(context).size.width,
                      ),
                      child: new Text(
                        event.description,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 16.0, color: Color(0xFF000000)),
                      ),
                    ),
                  ])
                ])),
            new Container(
              padding: EdgeInsets.only(
                left: (15 / 100) * MediaQuery.of(context).size.width,
                right: (10 / 100) * MediaQuery.of(context).size.width,
                top: (5 / 100) * MediaQuery.of(context).size.height,
              ),
              child: new MaterialButton(
                child: new Text(
                  "Path",
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Search( backMenu: backMenu, destination: event.room, myLocation: 'my Location',),
                      ));
                },
                padding: EdgeInsets.all(1.0),
                color: Color.fromRGBO(1, 38, 90, 1),
                textTheme: ButtonTextTheme.primary,
                minWidth: 0.7 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        )));
  }
}
