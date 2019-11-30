import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton ({this.x, this.y, this.title, this.time, this.speaker, this.room, this.onPressed});
  final int x;
  final int y;
  final String title;
  final String time;
  final String speaker;
  final String room;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: Container(
          width: 0.80 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          child:     
          new FlatButton(
          color: Color.fromRGBO(249, 228, 183, 1),        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  color: Color.fromRGBO(1, 38, 90, 1), fontSize: 20.0),
                ),
                Text(
                  speaker,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  color: Colors.black, fontSize: 15.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    "Time : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),

                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                    "Room : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),
                  Text(
                    room,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.black, fontSize: 15.5),
                  ),

                ],
                ),
                
              ],
            ), 
            onPressed: onPressed,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          )
      )
    );
  }
}