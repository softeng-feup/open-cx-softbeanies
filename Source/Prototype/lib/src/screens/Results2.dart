import 'package:flutter/material.dart';

class MyCustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final BuildContext context;

  const MyCustomAppBar2({
    Key key,
    @required this.height,
    @required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Container(
      height: 120,
      color: Color.fromRGBO(1, 38, 90, 1),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, left: 0, bottom: 12),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, left: 10, bottom: 12),
                child: new Text(
                  "Machine2",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          new Container(
            height: 20,
            color: Color.fromRGBO(249, 228, 183, 1),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class Results2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "SearchPage",
      home: new Scaffold(
        appBar: new MyCustomAppBar2(height: 200, context: ctxt),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}
