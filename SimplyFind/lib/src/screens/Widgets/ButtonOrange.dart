import 'package:flutter/material.dart';

class ButtonOrange extends StatelessWidget {
  ButtonOrange({this.x, this.y, this.title, this.onPressed});
  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: new MaterialButton(
          child: new Text(
            title,
            style: new TextStyle(
              fontSize: (11/ 100) * MediaQuery.of(context).size.width,
              color: Color.fromRGBO(1, 38, 90, 1),
            ),
          ),
          onPressed: onPressed,
          padding: EdgeInsets.all(1.0),
          color: Color.fromRGBO(249, 228, 183, 1),
          minWidth: 0.8 * MediaQuery.of(context).size.width,
          height: 0.15 * MediaQuery.of(context).size.height,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}