import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimplyFind Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFACDF87),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/Options': (context) => OptionsMenu(),
        '/Lectures' : (context) => Lectures(),
        '/Networking' : (context) => Networking(),
        '/Food' : (context) => Food(),
        '/Workshops': (context) => Workshops(),
        '/Wc': (context) => Wc(),
        '/Exits': (context) => Exits(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {Navigator.pushNamed(context, '/Options')}, // needed
        child: Image.asset(
          "images/start.png",
          width: 22,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class App_name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Text("SimplyFind", style: TextStyle(color: Colors.blue)),
    );
  }
}


class OptionsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Options"),),
      body: SafeArea(
        child: Container(
          color: Color(0xFFACDF87) ,
          child: Stack(
            children: <Widget>[
         /*     ButtonWithImage(image: "images/speech.png", onPressed: (){
                Navigator.pushNamed(context, '/Lectures');
              }, ),
              ButtonWithImage(image: "images/network.png", onPressed: (){
                Navigator.pushNamed(context, '/Networking');
              }, ),
              ButtonWithImage(image: "images/speech.png", onPressed: (){
                Navigator.pushNamed(context, '/Food');
              }, ),
              ButtonWithImage(image: "images/restaurant.png", onPressed: (){
                Navigator.pushNamed(context, '/Food');
              }, ),*/
             // IconsPics(x: 10, y: 10, image: "images/speech.png"),
              MyButton(x: 10, y:10, title: "Lectures", onPressed: (){
                Navigator.pushNamed(context, '/Lectures');
              }, ),
              MyButton(x: 60, y:10, title: "Networking", onPressed: (){
                Navigator.pushNamed(context, '/Networking');
              }),
              MyButton(x: 10, y:35, title: "Food", onPressed: (){
                Navigator.pushNamed(context, '/Food');
              }),
              MyButton(x: 60, y:35, title: "Workshops", onPressed: (){
                Navigator.pushNamed(context, '/Workshops');
              }),
              MyButton(x: 10, y:60, title: "wc", onPressed: (){
                Navigator.pushNamed(context, '/Wc');
              }),
              MyButton(x: 60, y:60, title: "exits", onPressed: (){
                Navigator.pushNamed(context, '/Exits');
              })
            ],
          ),
        )
      )
    );
  }
}

class ButtonWithImage extends StatelessWidget {
  ButtonWithImage({this.image, this.onPressed});
  final String image;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      // needed
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPressed, // needed
        child: Image.asset(
          image,
          width: 22,
          fit: BoxFit.cover,
          height: 22,
        ),
      ),
    );
  }
}

class IconsPics extends StatelessWidget {
  IconsPics({this.x, this.y, this.image});
  final int x;
  final int y;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x/100)*MediaQuery.of(context).size.width,
      top: (y/100)*MediaQuery.of(context).size.height,
      child: Container(
          width: 110.0,
          height: 100.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
          child: Image.asset(image)),
    );
  }
}

class BigButton extends StatelessWidget {
  BigButton({this.x, this.y, this.title, this.onPressed});
  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery
          .of(context)
          .size
          .width,
      top: (y / 100) * MediaQuery
          .of(context)
          .size
          .height,
      child: Container(
          width: 270.0,
          height: 50.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
          child: SizedBox.expand(
              child: OutlineButton(
                child: Text(title),
                borderSide: BorderSide(
                  color: Color(0xFFA5D6A7),
                  style: BorderStyle.solid, width: 2.8,
                ),
                onPressed: onPressed,
              )
          )
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  MyButton({this.x, this.y, this.title, this.onPressed });
  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x/100)*MediaQuery.of(context).size.width,
      top: (y/100)*MediaQuery.of(context).size.height,
      child: Container(
          width: 110.0,
          height: 100.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
         child: OutlineButton(
              child: Text(title, style: TextStyle(color: Color(0xFF083663),),),
                borderSide: BorderSide(
                color: Color(0xFFA5D6A7),
                style: BorderStyle.solid, width: 2.8,
                ),
                onPressed: onPressed,
            )
          )
      );
  }
}

class Lectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lectures"),),
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
      appBar: AppBar(title: Text("Networking"), ),
      body: Center(
        child: Text("MyNetworking", style: TextStyle(color: Color(0xFF2222FF),)
          ,)
      ),
    );
  }
}

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food'),),
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
      appBar: AppBar(title: Text("Workshops"),),
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
      appBar: AppBar(title: Text("wc"),),
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
      appBar: AppBar(title: Text(' Exits'),),
      body: Center(
        child: Text("My Exits"),
      ),
    );
  }
}