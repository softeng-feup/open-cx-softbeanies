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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFACDF87) ,
          child: Stack(
            children: <Widget>[
              UpperButton(),
              MyButton(x: 10, y:20, title: "Lectures", onPressed: (){
                Navigator.pushNamed(context, '/Lectures');
              }),
              MyButton(x: 60, y:20, title: "Networking", onPressed: (){
                Navigator.pushNamed(context, '/Networking');
              }),
              MyButton(x: 10, y:45, title: "Food", onPressed: (){
                Navigator.pushNamed(context, '/Food');
              }),
              MyButton(x: 60, y:45, title: "Workshops", onPressed: (){
                Navigator.pushNamed(context, '/Workshops');
              }),
              MyButton(x: 10, y:70, title: "wc", onPressed: (){
                Navigator.pushNamed(context, '/Wc');
              }),
              MyButton(x: 60, y:70, title: "exits", onPressed: (){
                Navigator.pushNamed(context, '/Exits');
              })
            ],
          ),
        )
      )
    );
  }
}

class UpperButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (10 / 100) * MediaQuery
          .of(context)
          .size
          .width,
      top: (5 / 100) * MediaQuery
          .of(context)
          .size
          .height,
      child: Container(
          width: 270.0,
          height: 50.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
          child: SizedBox.expand(
              child: OutlineButton(
                child: Text("Go Back"),
                borderSide: BorderSide(
                  color: Color(0xFFA5D6A7),
                  style: BorderStyle.solid, width: 2.8,
                ),
                onPressed: () {},
              )
          )
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  MyButton({this.x, this.y, this.title, this.onPressed});
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

class Lectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lectures"),),
      body: Center(
        child: Text("MyLectures"),
      ),
    );
  }

}

class Networking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Networking"),),
      body: Center(
        child: Text("MyNetworking"),
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