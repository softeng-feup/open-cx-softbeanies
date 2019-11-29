import 'package:flutter/material.dart';

class LocateImage extends StatelessWidget {
  LocateImage({this.x, this.y, this.imageName});
  final int x;
  final int y;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      child: Image.asset(
        imageName,
        width: 0.6 * MediaQuery.of(context).size.width,
        height: 0.4 * MediaQuery.of(context).size.height,
      ),
    );
  }
}
