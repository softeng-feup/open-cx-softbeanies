import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton(
      {this.title, this.time, this.speaker, this.room, this.onPressed});
  final String title;
  final String time;
  final String speaker;
  final String room;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.symmetric(
            vertical: (2 / 100) * MediaQuery.of(context).size.height,
            horizontal: (5 / 100) * MediaQuery.of(context).size.width,),
        width: 0.80 * MediaQuery.of(context).size.width,
        height: 0.18 * MediaQuery.of(context).size.height,
        child: new FlatButton(
            color: Color.fromRGBO(249, 228, 183, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(1, 38, 90, 1),
                    fontSize: (6/ 100) * MediaQuery.of(context).size.width),
                ),
                Text(
                  speaker,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: (5/ 100) * MediaQuery.of(context).size.width),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Time :  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: (4.1/ 100) * MediaQuery.of(context).size.width),
                    ),
                    Text(
                      time,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: (4.1/ 100) * MediaQuery.of(context).size.width),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Room :  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: (4/ 100) * MediaQuery.of(context).size.width),
                    ),
                    Text(
                      room,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: (4/ 100) * MediaQuery.of(context).size.width),
                    ),
                  ],
                ),
              ],
            ),
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))));
  }
}
