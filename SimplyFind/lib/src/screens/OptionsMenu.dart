import 'package:flutter/material.dart';
import '../../MockGenerator.dart';
import '../../POI/Event.dart';
import '../GoogleMapsWidget.dart';
import 'AppBarCostumize.dart';

/**    MENUS */
class OptionsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Options", backMenu: '/', ),
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
                  image: "assets/images/network.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Networking');
                  },
                  legend: "Networking"),
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
                    Navigator.pushNamed(context, '/Exits');
                  },
                  legend: "Exits")
            ],
          ),
        )));
  }
}

class ButtonWithImage extends StatelessWidget {
  ButtonWithImage({this.x, this.y, this.image, this.onPressed, this.legend});
  final int x;
  final int y;
  final String image;
  final Function onPressed;
  final String legend;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: Container(
            width: 0.40 * MediaQuery.of(context).size.width,
            height: 0.20 * MediaQuery.of(context).size.height,
            child: new FlatButton(
                onPressed: onPressed,
                color: Color.fromRGBO(249, 228, 183, 1),
                padding: EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom:10),
                        child:
                            Text(legend, style: new TextStyle(fontSize: 25, color: Color.fromRGBO(1, 38, 90, 1), ))),
                        new Image.asset(image,
                        width: 0.30 * MediaQuery.of(context).size.width,
                        height: 0.10 * MediaQuery.of(context).size.height,
                        color: Color.fromRGBO(1, 38, 90, 1),)
                  ],
                ))
      )
    );
  }
}

/* Events Menu is used for display of workshops and lectures */
class EventsMenu extends StatelessWidget {
  final BuildContext context;
  final String title;
  List<Event> events;
  EventsMenu({this.context, @required this.title });

  @override
  Widget build(BuildContext context) {
    var numberOfevents = 3;
    if(title == "Lectures")
      events = MockGenerator.Lectures; //get lectures appening next
    else
      events = MockGenerator.Workshops; //get Workshops appening next
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: title, backMenu: '/Options',),
      body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
            if(numberOfevents == 0)
             new Padding(
              padding: EdgeInsets.only(top:(35 / 100) * MediaQuery.of(context).size.height,),
              child: new Text(
              "Sorry! There are no " + title + " available.", 
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 30.0, color: Color.fromRGBO(1, 38, 90, 1)),
              )
            ),
            for(int i= 0; i < numberOfevents; i++)
                OptionButton(
                  x: 10,
                  y: 5 + i * 20,
                  title:  events[i].name,
                  time: events[i].hour,
                  speaker: events[i].speaker,
                  room: events[i].room,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  }),                 
            ],
          ),
        )
      )
    );
  }
}


class NetworkingMenu extends StatelessWidget {
  int numberOfNetworking = 3;
  List<Event> networkingEvents = MockGenerator.Netwoking ;
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Networking", backMenu: '/Options',),
      body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
               if( numberOfNetworking == 0)
             new Padding(
              padding: EdgeInsets.only(top:(35 / 100) * MediaQuery.of(context).size.height,),
              child: new Text(
              "Sorry! There are no Networking events available.", 
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 30.0, color: Color.fromRGBO(1, 38, 90, 1)),
              )
            ),
            for(int i= 0; i < numberOfNetworking; i++)
                ButtonNetworking(
                  x: 10,
                  y: 5 + i * 20,
                  title:  networkingEvents[i].name,
                  time: networkingEvents[i].hour,
                  date: networkingEvents[i].date,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  }),                 
            ],
          ),
        )
      )
    );
  }
}

class FoodMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Food", backMenu: '/Options',),
      body: SafeArea(
          child: new Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonOrange(
                x: 10,
                y: 5,
                title: "Library Bar",
                onPressed: () {
                  Navigator.pushNamed(context, '/Food');
                }
              ),
              ButtonOrange(
                x: 10,
                y: 25,
                title: "Mines Bar",
                onPressed: () {
                  Navigator.pushNamed(context, '/Food');
                }
              ),
              ButtonOrange(
                x: 10,
                y: 45,
                title: "Grill",
                onPressed: () {
                  Navigator.pushNamed(context, '/Food');
                }
              ),
              ButtonOrange(
                x: 10,
                y: 65,
                title: "Machines",
                onPressed: () {
                  Navigator.pushNamed(context, '/Food');
                }
              ),
            ],
          ),
        )
      )
    );
  }
}

class WcMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Wc", backMenu: '/Options'),
      body: SafeArea(
            child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonOrange(
                  x: 10,
                  y: 20,
                  title: "Men",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Wc');
                  },
              ),
              ButtonOrange(
                  x: 10,
                  y: 45,
                  title: "Woman",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Wc');
                  },
                )
            ],
          )
        )
      )
    );
  }
}

class Exits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Exits", backMenu: '/Options'),
      body: new GoogleMapsWidget(MockGenerator.Workshops,MockGenerator.Workshops),
    );
  }
}

/// Widgets */

class LocateText extends StatelessWidget {
  LocateText({this.x, this.y, this.title, this.size});
  final int x;
  final int y;
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return new Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: new Text(
        title,
        textAlign: TextAlign.center,
        style: new TextStyle(fontSize: size, color: Color(0xFF073763)),
      ),
    );
  }
}

class LocateImage extends StatelessWidget {
  LocateImage({this.x, this.y, this.imageName});
  final int x;
  final int y;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: Image.asset(
        imageName,
        width: 0.6 * MediaQuery.of(context).size.width,
        height: 0.4 * MediaQuery.of(context).size.height,
      ),
    );
  }
}


 /** 
  * All Buttons
  */
class Button extends StatelessWidget {
  Button({this.x, this.y, this.title, this.onPressed});
  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: new MaterialButton(
          child: new Text(
            title,
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
          padding: EdgeInsets.all(1.0),
          color: Color.fromRGBO(1, 38, 90, 1),
          textTheme: ButtonTextTheme.primary,
          minWidth: 0.8 * MediaQuery.of(context).size.width,
          height: 0.1 * MediaQuery.of(context).size.height,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}

class ButtonNetworking extends StatelessWidget {
  ButtonNetworking( { this.x, this.y, this.title, this.date, this.time, this.onPressed});
  final int x;
  final int y;
  final String title;
  final String date;
  final String time;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,       
        child: new MaterialButton(
          minWidth: 0.80 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          color: Color.fromRGBO(249, 228, 183, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color.fromRGBO(1, 38, 90, 1), fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  new Text(
                    "Date :  ",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  new Text(
                    date,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  new Text(
                    " - ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),

                ],
                ),                
              ],
            ), 
            onPressed: onPressed,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )      
    );
  }
}

class OptionButton extends StatelessWidget {
  OptionButton ({this.x, this.y, this.title, this.time, this.speaker, this.room, this.onPressed});
  final int x;
  final int y;
  final String title;
  final String time;
  final String speaker;
  final String room;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: Container(
          width: 0.80 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          child:     
          new FlatButton(
          color: Color.fromRGBO(249, 228, 183, 1),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  color: Color.fromRGBO(1, 38, 90, 1), fontSize: 20.0),
                ),
                Text(
                  speaker,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  color: Colors.black, fontSize: 15.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    "Time : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),

                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    "Room : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  Text(
                    room,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),

                ],
                ),
                
              ],
            ), 
            onPressed: onPressed,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          )
      )
    );
  }
}

class ButtonOrange extends StatelessWidget {
  ButtonOrange({this.x, this.y, this.title, this.onPressed});
  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: new MaterialButton(
          child: new Text(
            title,
            style: new TextStyle(
              fontSize: 30.0,
              color: Color.fromRGBO(1, 38, 90, 1),
            ),
          ),
          onPressed: onPressed,
          padding: EdgeInsets.all(1.0),
          color: Color.fromRGBO(249, 228, 183, 1),
          minWidth: 0.8 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}