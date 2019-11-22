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
          height: (height / 100) * MediaQuery.of(context).size.height,
          color: Color.fromRGBO(1, 38, 90, 1),
          child: new Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: (5 / 100) * MediaQuery.of(context).size.height, //puts the first button in the correct y
                    bottom: (1.5 / 100) * MediaQuery.of(context).size.height //puts 2 buttons closer
                  ),
                  child: Row(
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
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(
                  bottom:(1 / 100) * MediaQuery.of(context).size.height,
                  left:(13 / 100) * MediaQuery.of(context).size.width //moves the second buttom of the app bar
                ),
                child:
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new TextFormField(
                          decoration: new InputDecoration(
                          labelText: 'Choose Destination',
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
       new Container(
          height:(2 / 100) * MediaQuery.of(context).size.height, //change size of yellow line
          color: Color.fromRGBO(249, 228, 183, 1),
        )
      ],
    );
  }

  @override 
  Size get preferredSize => Size.fromHeight((this.height / 100) * MediaQuery.of(context).size.height); //change size of app bar
}

class MyCustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;
  final String title;

  const MyCustomAppBar2({
    Key key,
    @required this.height,
    @required this.context,
    @required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Container(
      height: (height / 100) * MediaQuery.of(context).size.height,
      color: Color.fromRGBO(1, 38, 90, 1),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: (4.7 / 100) * MediaQuery.of(context).size.height,
                  left: 0, 
                  bottom: 0
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: (7.15 / 100) * MediaQuery.of(context).size.height,
                  left: (2 / 100) * MediaQuery.of(context).size.width,
                  bottom: (2.57 / 100) * MediaQuery.of(context).size.height
                ),
                child: new Text(
                  this.title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          new Container(
            height:(2 / 100) * MediaQuery.of(context).size.height,
            color: Color.fromRGBO(249, 228, 183, 1),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((height / 100) * MediaQuery.of(context).size.height);
}