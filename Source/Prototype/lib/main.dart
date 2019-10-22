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
  Widget build(BuildContext context) {
  return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFCAEABC) ,
          child: Stack(
            children: <Widget>[
              Button(x: 12, y:60, title: "Search", onPressed: (){
                Navigator.pushNamed(context, '/Options');
              }, ),
              Button(x: 12, y:75, title: "Explore", onPressed: (){
                Navigator.pushNamed(context, '/Options');
              }, ),
              LocateImage(x: 20, y: 20, imageName: "images/start.png"),
              LocateText(x: 12,y: 10, title: "Simplyfind", size:55.0)
            ],
          ),
        )
      )
    );
  }
}

class LocateText extends StatelessWidget {
  LocateText({this.x, this.y, this.title, this.size});
  final int x;
  final int y;
  final String title;
  final double size;
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
       child: new Text(title, 
          style: new TextStyle(
              fontSize: size,
              color: Color(0xFF073763)
          ),
        ),
    );
  }
}
class LocateImage extends StatelessWidget {
  LocateImage({ this.x,this.y, this.imageName });
  final int x;
  final int y;
  final String imageName;

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
      child: Image.asset(
          imageName,
          width: 0.6 * MediaQuery
          .of(context)
          .size
          .width,
          height: 0.4 * MediaQuery
          .of(context)
          .size
          .height,
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
      left: (x / 100) * MediaQuery
          .of(context)
          .size
          .width,
      top: (y / 100) * MediaQuery
          .of(context)
          .size
          .height,
      child:
      new MaterialButton(
        child: new Text(title, 
          style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.all(1.0),
        color: Color(0xFF083663),
        textTheme: ButtonTextTheme.primary,
        minWidth: 0.8 * MediaQuery
          .of(context)
          .size
          .width,
        height: 0.1 * MediaQuery
          .of(context)
          .size
          .height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      )
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
          color: Color(0xFFCAEABC) ,
          child: Stack(
            children: <Widget>[
              ButtonWithImage(x: 5, y:2, image: "images/speech.png", onPressed: (){
                Navigator.pushNamed(context, '/Lectures');
              }, legend: "Lectures" ),
              ButtonWithImage(x: 55, y:2,image: "images/network.png", onPressed: (){
                Navigator.pushNamed(context, '/Networking');
              }, legend: "Networking"),
              ButtonWithImage(x: 5, y:30, image: "images/restaurant.png", onPressed: (){
                Navigator.pushNamed(context, '/Food');
              }, legend: "Food"),
              ButtonWithImage(x: 55, y:30, image: "images/student.png", onPressed: (){
                Navigator.pushNamed(context, '/Workshops');
              }, legend: "Workshops" ),
              ButtonWithImage(x: 5, y:60, image: "images/wc.png", onPressed: (){
                Navigator.pushNamed(context, '/Wc');
              }, legend: "Wc"),
              ButtonWithImage(x: 55, y:60, image: "images/logout.png", onPressed: (){
                Navigator.pushNamed(context, '/Exits');
              }, legend: "Exits")
            ],
          ),
        )));
  }
}

class ButtonWithImage extends StatelessWidget {
  ButtonWithImage({this. x, this.y, this.image, this.onPressed, this.legend});
  final int x;
  final int y;
  final String image;
  final Function onPressed;
  final String legend;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x/100)*MediaQuery.of(context).size.width,
      top: (y/100)*MediaQuery.of(context).size.height,
      child: 
      new FlatButton(
        onPressed: onPressed,
        color: Color(0xFFB6D7A8),
        padding: EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            new Text(legend),
            new Image.asset(
              image,
              width: 0.40 *MediaQuery.of(context).size.width,
              height: 0.20 *MediaQuery.of(context).size.height)            
          ],
      )
     )
    );
  }
}

/*
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
*/
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
