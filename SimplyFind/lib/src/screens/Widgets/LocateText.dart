import 'package:flutter/material.dart';

class LocateText extends StatelessWidget {
  LocateText({this.x, this.y, this.title, this.size, this.color});
  final int x;
  final int y;
  final String title;
  final double size;
  final int color;
  @override
  Widget build(BuildContext context) {
    return new Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: new Text(
        title,
        textAlign: TextAlign.center,
        style: new TextStyle(fontSize: size, color: Color(color)),
      ),
    );
  }
}