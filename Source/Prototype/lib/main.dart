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
        '/': (context) => Search(),
        '/Options': (context) => OptionsMenu(),
        '/Lectures': (context) => Lectures(),
        '/Networking': (context) => Networking(),
        '/Food': (context) => Food(),
        '/Workshops': (context) => Workshops(),
        '/Wc': (context) => Wc(),
        '/Exits': (context) => Exits(),
        //'/Search': (context) => Search(),
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
      child: Text("SimplyFind", style: TextStyle(color: Colors.blue)),
    );
  }
}

class OptionsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Options"),
        ),
        body: SafeArea(
            child: Container(
          color: Color(0xFFACDF87),
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
              MyButton(
                x: 10,
                y: 10,
                title: "Lectures",
                onPressed: () {
                  Navigator.pushNamed(context, '/Lectures');
                },
              ),
              MyButton(
                  x: 60,
                  y: 10,
                  title: "Networking",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Networking');
                  }),
              MyButton(
                  x: 10,
                  y: 35,
                  title: "Food",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Food');
                  }),
              MyButton(
                  x: 60,
                  y: 35,
                  title: "Workshops",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Workshops');
                  }),
              MyButton(
                  x: 10,
                  y: 60,
                  title: "wc",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Wc');
                  }),
              MyButton(
                  x: 60,
                  y: 60,
                  title: "exits",
                  onPressed: () {
                    Navigator.pushNamed(context, '/Exits');
                  })
            ],
          ),
        )));
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
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
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
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: Container(
          width: 270.0,
          height: 50.0,
          margin: EdgeInsets.symmetric(vertical: 3.0),
          child: SizedBox.expand(
              child: OutlineButton(
            child: Text(title),
            borderSide: BorderSide(
              color: Color(0xFFA5D6A7),
              style: BorderStyle.solid,
              width: 2.8,
            ),
            onPressed: onPressed,
          ))),
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
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: Container(
            width: 110.0,
            height: 100.0,
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: OutlineButton(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF083663),
                ),
              ),
              borderSide: BorderSide(
                color: Color(0xFFA5D6A7),
                style: BorderStyle.solid,
                width: 2.8,
              ),
              onPressed: onPressed,
            )));
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

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190,
          color: Color.fromRGBO(7, 55, 99,1),
          child: new Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40.0,
                      semanticLabel: 'Go back',
                    ),
                    Expanded(
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          filled: true,
                          labelText: 'My Localization',
                          fillColor: Colors.white,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ), // icon is 48px widget.
                          ),
                        ), // icon is 48px widge
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40),
                    Expanded(
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          labelText: 'Choose Destination',
                           filled: true,
                          fillColor: Colors.white,
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 5.0),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                        ), // icon is 48px widge
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        new Container(
  height: 30,
  color: Color.fromRGBO(182, 215, 168, 1),
)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar(height: 250),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}
