import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "ResultPage",
      home: new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromRGBO(7, 55, 99, 1),
            flexibleSpace: Stack(children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 35),
                      width: 95,
                      height: 95,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage("/assets/images/left.png"),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  new Text('Oi', 
                  style: TextStyle(color: Colors.white, fontSize: 40),
                  textAlign: TextAlign.right,
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.amber[600],
                  height: 20,
                  width: 600,
                ),
              ),
            ]),
          ),
        ),
        body: new Center(
          child: new Text("Hello "),
        ),
      ),
    );
  }
}