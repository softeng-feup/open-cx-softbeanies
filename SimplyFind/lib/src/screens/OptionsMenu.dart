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
                    Navigator.pushNamed(context, '/CheckIn');
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
  String nextMenu, backMenu;
  List<Event> events;
  EventsMenu({this.context, @required this.title });

  @override
  Widget build(BuildContext context) {
    if(title == "Lectures"){
      backMenu = '/Lectures';
      events = MockGenerator.Lectures; //get lectures appening next
    }      
    else {
      backMenu = '/Workshops';
      events = MockGenerator.Workshops; //get Workshops appening next
    }
    var numberOfevents = events.length;

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
                    Navigator.push(context, MaterialPageRoute( builder: (context) 
                      => ShowDescriptionMenu(title: title, backMenu: backMenu, event: events[i], ),
                    )); 
                  }),                 
            ],
          ),
        )
      )
    );
  }
}

class CheckInMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 15, context: context, title: "Check In", backMenu: '/Options'),
      body: new GoogleMapsWidget(MockGenerator.Workshops,MockGenerator.Workshops),
    );
  }
}


class FoodMenu extends StatelessWidget {
  List<String> buttonTitles = ["Bar", "Grill", "Machines", "Coffe break"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Food", backMenu: '/Options',),
      body: SafeArea(
          child: new Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              for(int i = 0; i < buttonTitles.length; i++)
              ButtonOrange(
                x: 10,
                y: 4 + i * 20,
                title: buttonTitles[i],
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
    List<String> buttonTitles = ["Men", "Woman" ];
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: "Wc", backMenu: '/Options'),
      body: SafeArea(
            child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              for(int i =0 ; i < buttonTitles.length; i++)
              ButtonOrange(
                  x: 10,
                  y: 18 + i * 27,
                  title: buttonTitles[i],
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

class ShowDescriptionMenu extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String backMenu;
  Event event;
  ShowDescriptionMenu({this.context, @required this.title, @required this.backMenu, @required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyCustomAppBar2(height: 14, context: context, title: title, backMenu: backMenu),
      body: SafeArea(
        child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: <Widget>[
          new Container(
            width: (5/ 100) * MediaQuery.of(context).size.width,
            height: (4/ 100) * MediaQuery.of(context).size.height,
          ),
          new Container( 
            width: (90/ 100) * MediaQuery.of(context).size.width,
            height: (60/ 100) * MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
              left: (1/ 100) * MediaQuery.of(context).size.width,
              right: (1/ 100) * MediaQuery.of(context).size.width,
            ),           
            decoration: new BoxDecoration(             
              color: Color.fromRGBO(249, 228, 183, 1),
              borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0),
              bottomLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0))
            ),
            child: Stack(
            children: <Widget>[ 
              new Column(
              children: <Widget>[
                new Container(  
                  padding: EdgeInsets.only(
                    top: (5/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    event.name,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 20.0, color: Color(0xFF073763)),                    
                  ),          
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: (3/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    "Speaker :  " + event.speaker,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 17.0, color: Color(0xFF000000)), 
                  ),
                ),
                new Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: (2/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    "Room :  " + event.room,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 17.0, color: Color(0xFF000000)), 
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: (2/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    "Date :  " + event.date,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 17.0, color: Color(0xFF000000)), 
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: (2/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    "Hour :  " + event.hour,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 17.0, color: Color(0xFF000000)), 
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: (2/ 100) * MediaQuery.of(context).size.height,
                  ),
                  child: new Text(
                    "Description: ",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0, color: Color(0xFF000000)), 
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: (2/ 100) * MediaQuery.of(context).size.height,
                    left: (1/ 100) * MediaQuery.of(context).size.width,
                    right: (1/ 100) * MediaQuery.of(context).size.width,
                  ),
                  child: new Text(
                    event.description,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0, color: Color(0xFF000000)), 
                  ),
                ),
              
              ]
              )
            ]
          )
        ),    
        new Container(
          padding: EdgeInsets.only(
            left: (15/ 100) * MediaQuery.of(context).size.width,
            right:(10/ 100) * MediaQuery.of(context).size.width,
            top: (5/ 100) * MediaQuery.of(context).size.height,
          ),
          child: new MaterialButton(
          child: new Text(
            "Path",
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          onPressed: (){},
          padding: EdgeInsets.all(1.0),
          color: Color.fromRGBO(1, 38, 90, 1),
          textTheme: ButtonTextTheme.primary,
          minWidth: 0.7 * MediaQuery.of(context).size.width,
          height: 0.1 * MediaQuery.of(context).size.height,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )               
        ],
        )
      )
    );
  }
}

/// Widgets */
class LocateText extends StatelessWidget {
  LocateText({this.x, this.y, this.title, this.size, this.color});
  final int x;
  final int y;
  final String title;
  final double size;
  final int color;
  @override
  Widget build(BuildContext context) {
    return new Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: new Text(
        title,
        textAlign: TextAlign.center,
        style: new TextStyle(fontSize: size, color: Color(color)),
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
  @required final int x;
  @required final int y;
  @required final String title;
  @required final Function onPressed;

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