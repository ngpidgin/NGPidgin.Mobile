import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';

class SplashLoader extends StatelessWidget {
  Future<ThemeMode> getTheme() async {
    int theme = await LocalStorage.getInt(SettingKeys.themeMode) ??
        ThemeMode.light.index;
    return ThemeMode.values[theme];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTheme(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: (snapshot.data as ThemeMode) == ThemeMode.light
                        ? Palette.Green
                        : Palette.Charcoal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Center(
                            child: Image.asset("assets/imgs/app_logo_text.png",
                                width: double.infinity))),
                    SizedBox(height: 100),
                    Text("Abeg chilax!",
                        style: TextStyle(
                            fontFamily: Fonts.Default,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        textDirection: TextDirection.ltr),
                    Text("we dey run some racket for you!",
                        style: TextStyle(fontFamily: Fonts.Default),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr),
                  ],
                ));
          }
        });
  }
}
