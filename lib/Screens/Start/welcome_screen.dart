import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';

class WelcomeScreen extends StatelessWidget {
  final ThemeMode themeMode;
  const WelcomeScreen(this.themeMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isLight = themeMode == ThemeMode.light;
    Color bodyColor = isLight ? Palette.Charcoal : Colors.white;

    return Scaffold(
        backgroundColor: isLight ? Palette.Lavendar : Palette.Charcoal,
        body: Column(children: [
          Container(
            height: size.height * 0.75,
            width: size.width,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: isLight ? Colors.white : Palette.PaleDark,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
                  child: SvgPicture.asset("assets/imgs/powerful_girl_flag.svg",
                      height: size.height * 0.4),
                ),
                Text(AppInfo.FullName,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: bodyColor)),
                SizedBox(height: 20),
                Text(
                  Globals.languageKit.welcomeIntro,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: bodyColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Text(
                  "9ja's official language",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: bodyColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
              height: size.height * 0.25,
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              child: Button(
                Globals.languageKit.welcomeBtnText,
                () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AppNavigator();
                  }));
                },
                bgColor: Palette.PrimaryColor,
                width: double.infinity,
                textStyle: TextStyle(fontSize: 20, color: Colors.white),
                paddingVertical: 15,
              ))
        ]));
  }
}
