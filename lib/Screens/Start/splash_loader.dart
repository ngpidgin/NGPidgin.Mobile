import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class SplashLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Palette.Green),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Center(
                    child: CircularProgressIndicator(color: Colors.white))),
            SizedBox(height: 100),
            Text("Abeg chilax!",
                style: TextStyle(
                    fontFamily: Fonts.Default, fontWeight: FontWeight.w600),
                textDirection: TextDirection.ltr),
            Text("we dey run some racket for you!",
                style: TextStyle(fontFamily: Fonts.Default),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr),
          ],
        ));
  }
}
