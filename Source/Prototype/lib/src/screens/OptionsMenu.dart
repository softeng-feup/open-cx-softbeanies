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
          color: Color(0xFF083663),
          textTheme: ButtonTextTheme.primary,
          minWidth: 0.8 * MediaQuery.of(context).size.width,
          height: 0.1 * MediaQuery.of(context).size.height,
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
          color: Color.fromRGBO(250, 250, 235, 1),
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
                color: Color.fromRGBO(227, 180, 102, 1),
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    new Text(legend, style: new TextStyle(fontSize: 20.0)),
                    new Image.asset(image,
                        width: 0.30 * MediaQuery.of(context).size.width,
                        height: 0.10 * MediaQuery.of(context).size.height),
                  ],
                ))));
  }
}

class Lectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures"),
      ),
      body: Center(
        child: Image.asset('images/wc.png'),
      ),
    );
  }
}

class Networking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking"),
      ),
      body: Center(
          child: Text(
        "MyNetworking",
        style: TextStyle(
          color: Color(0xFF2222FF),
        ),
      )),
    );
  }
}

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: Center(
        child: Text("MyFood"),
      ),
    );
  }
}

class Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshops"),
      ),
      body: Center(
        child: Text("MyWorkshops"),
      ),
    );
  }
}

class Wc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wc"),
      ),
      body: Center(
        child: Text("wc"),
      ),
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
