import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.x, this.y, this.title, this.onPressed});
  @required final int x;
  @required final int y;
  @required final String title;
  @required final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: new MaterialButton(
          child: new Text(
            title,
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
          padding: EdgeInsets.all(1.0),
          color: Color.fromRGBO(1, 38, 90, 1),
          textTheme: ButtonTextTheme.primary,
          minWidth: 0.8 * MediaQuery.of(context).size.width,
          height: 0.1 * MediaQuery.of(context).size.height,
          shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}