import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Container(
        height: size.height * 0.75,
        width: size.width,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/imgs/app_logo_text.png"),
            SizedBox(height: 60),
            Text("abeg chilax!", style: TextStyle(fontWeight: FontWeight.w600)),
            Text("we dey load some packages..")
          ],
        ),
      ),
      Container(
          height: size.height * 0.25,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Version: " + AppInfo.VersionName,
                  style: TextStyle(fontSize: 11)),
              SizedBox(height: 15),
              Text(
                AppInfo.SplashFooterText,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
                textDirection: TextDirection.rtl,
              )
            ],
          ))
    ]));
  }
}
