import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class BackgroundFiller extends StatelessWidget {
  final double height;
  final double width;

  BackgroundFiller(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: Colors.white)),
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: Palette.PrimaryColor),
      ),
    ]);
  }
}
