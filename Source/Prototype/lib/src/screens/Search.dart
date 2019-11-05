import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;

  const MyCustomAppBar({
    Key key,
    @required this.height,
    @required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Column(
      children: [
        Container(
          height: 190,
          color: Color.fromRGBO(1, 38, 90, 1),
          child: new Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
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
          color: Color.fromRGBO(227, 180, 102, 1),
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
        appBar: new MyCustomAppBar(height: 250, context: ctxt),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}