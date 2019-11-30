import 'package:flutter/material.dart';

class ButtonWithImage extends StatelessWidget {
  ButtonWithImage({this.x, this.y, this.image, this.onPressed, this.legend});
  final int x;
  final int y;
  final String image;
  final Function onPressed;
  final String legend;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (x / 100) * MediaQuery.of(context).size.width,
        top: (y / 100) * MediaQuery.of(context).size.height,
        child: Container(
            width: 0.40 * MediaQuery.of(context).size.width,
            height: 0.20 * MediaQuery.of(context).size.height,
            child: new FlatButton(
                onPressed: onPressed,
                color: Color.fromRGBO(249, 228, 183, 1),
                padding: EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(legend,
                            style: new TextStyle(
                              fontSize: 25,
                              color: Color.fromRGBO(1, 38, 90, 1),
                            ))),
                    new Image.asset(
                      image,
                      width: 0.30 * MediaQuery.of(context).size.width,
                      height: 0.10 * MediaQuery.of(context).size.height,
                      color: Color.fromRGBO(1, 38, 90, 1),
                    )
                  ],
                ))));
  }
}
