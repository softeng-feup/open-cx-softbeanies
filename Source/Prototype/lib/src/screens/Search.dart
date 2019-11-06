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
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom:20),
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
                Padding(padding: EdgeInsets.only(bottom:10, left:50),
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
          height: 30,
          color: Color.fromRGBO(249, 228, 183, 1),
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
