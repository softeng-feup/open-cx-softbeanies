import 'package:flutter/material.dart';

class LocateText extends StatelessWidget {
  LocateText({this.x, this.y, this.title, this.size});
  final int x;
  final int y;
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: new Text(
        title,
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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ));
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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ));
  }
}
class OptionsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Options",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
        ),
        body: SafeArea(
            child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonWithImage(
                  x: 5,
                  y: 7,
                  image: "images/speech.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  },
                  legend: "Lectures"),
              ButtonWithImage(
                  x: 55,
                  y: 7,
                  image: "images/network.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Networking');
                  },
                  legend: "Networking"),
              ButtonWithImage(
                  x: 5,
                  y: 35,
                  image: "images/restaurant.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Food');
                  },
                  legend: "Food"),
              ButtonWithImage(
                  x: 55,
                  y: 35,
                  image: "images/student.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  },
                  legend: "Workshops"),
              ButtonWithImage(
                  x: 5,
                  y: 62,
                  image: "images/wc.png",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Wc');
                  },
                  legend: "Wc"),
              ButtonWithImage(
                  x: 55,
                  y: 62,
                  image: "images/logout.png",
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          )
      )
    );
  }
}

class Lectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var numberOfLectures = 3;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Lectures",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
        ),
        body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
            if(numberOfLectures >= 1)
              OptionButton(
                  x: 10,
                  y: 5,
                  title: "Lecture 1 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "121",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  }),
              if(numberOfLectures >= 2)
              OptionButton(
                  x: 10,
                  y: 25,
                  title: "Lecture 2 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "221",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  }),
              if(numberOfLectures >= 3)
              OptionButton(
                  x: 10,
                  y: 45,
                  title: "Lecture 3 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "333",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lectures');
                  }),
              if(numberOfLectures >= 4)
               OptionButton(
                  x: 10,
                  y: 65,
                  title: "Lecture 4 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "123",
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
        child: new Container(
          width: 0.80 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          color: Color.fromRGBO(249, 228, 183, 1),
          child:     
          new FlatButton(
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )
      )
      
    );
  }
}
class Networking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Networking",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
      ),
      body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ButtonNetworking(
                x: 10,
                y: 20,
                title: "Session 1",
                date: "Day 11",
                time: "11:30",
                onPressed: () {
                    Navigator.pushNamed(context, '/Networking');
                }
              )
            ],
          ),
        )
      )
    );
  }
}

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Food",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
      ),
      body: SafeArea(
          child: Container(
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

class Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var numberOfWorkshops = 3;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Workshops",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
        ),
        body: SafeArea(
          child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              if(numberOfWorkshops >= 1)
              OptionButton(
                  x: 10,
                  y: 5,
                  title: "Workshop 1 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "121",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  }),
              if(numberOfWorkshops >= 2)
              OptionButton(
                  x: 10,
                  y: 25,
                  title: "Workshop 2 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "221",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  }),
              if(numberOfWorkshops >= 3)
              OptionButton(
                  x: 10,
                  y: 45,
                  title: "Workshop 3 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "333",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  }),
              if(numberOfWorkshops >= 4)
              OptionButton(
                  x: 10,
                  y: 65,
                  title: "Workshop 4 Name",
                  time: "11:30",
                  speaker: "Ademar Aguiar",
                  room: "123",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  }),
            ],
          ),
        )
      )
    );
  }
}


class Wc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Wc",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(1, 38, 90, 1),
      ),
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
      appBar: AppBar(
        title: Text(' Exits'),
      ),
      body: Center(
        child: Text("My Exits"),
      ),
    );
  }
}
