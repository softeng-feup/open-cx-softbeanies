import 'package:flutter/material.dart';
import '../Model-POI/Place.dart';
import 'Widgets/MyCustomForm.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;
  /*parameters needed fot the search bar */
  final String destination;
  final String location;
  final List<Place> wantedPlaces;
  final Place origin;

  MyCustomAppBar({
    Key key,
    @required this.height,
    @required this.context,
    @required this.destination,
    @required this.location,
    @required this.wantedPlaces,
    @required this.origin,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    double finalHeight = (MediaQuery.of(context).size.height / 100 * this.height);
    return Container(
      key: Key("location"),
      height: finalHeight,
      color: Color.fromRGBO(1, 38, 90, 1),
      child: new Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 0.20 *
                      finalHeight, //puts the first button in the correct y
                  bottom: 0.05 * finalHeight //puts 2 buttons closer
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    key: Key("locationForm"),
                    child: new MyCustomForm(finalHeight: finalHeight, context: context, type: "origin", origin: origin,wantedPlaces: wantedPlaces, destination: destination, location: location,),
                  ),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                bottom: 0.05 * finalHeight,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color.fromRGBO(1, 38, 90, 1),
                    onPressed: () {},
                  ),
                  Expanded(
                    key: Key("destination"),
                    child: new MyCustomForm(finalHeight: finalHeight, context: context, type: "destination", origin: origin, wantedPlaces: wantedPlaces, location: location, destination: destination,),
                  ),
                ],
              ),
            ),
            Expanded(
              child:
              new Container(
                height: 0.1 * finalHeight, //change size of yellow line
                color: Color.fromRGBO(249, 228, 183, 1),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((MediaQuery.of(context).size.height / 100 * this.height)); //change size of app bar
}

class MyCustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;
  final String title;

  const MyCustomAppBar2(
      {Key key,
      @required this.height,
      @required this.context,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext c) {
    double finalHeight =
        (MediaQuery.of(context).size.height / 100 * this.height);
    double finalWidth = (MediaQuery.of(context).size.width / 100);
    double topHeight = 0.90 * finalHeight;
    return Container(
      height: finalHeight,
      color: Color.fromRGBO(1, 38, 90, 1),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: topHeight * 0.35, left: 0, bottom: 0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.35 * topHeight,
                  left: 0.25 * finalWidth,
                ),
                child: new Text(
                  this.title,
                  style: TextStyle(color: Colors.white, fontSize: (6/ 100) * MediaQuery.of(context).size.width),
                ),
              ),
            ],
          ),
          Expanded(
            child:
          Padding(
                padding: EdgeInsets.only(
                  top: topHeight - 0.95 *topHeight,
                ),
              child:    
              new Container(
              height: 0.1 * finalHeight, //change size of yellow line
              color: Color.fromRGBO(249, 228, 183, 1),
                ),
              ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((MediaQuery.of(context).size.height / 100 * this.height));
}
