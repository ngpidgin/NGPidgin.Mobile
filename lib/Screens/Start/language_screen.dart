import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/welcome_screen.dart';
import 'package:ngpidgin/components/button_right_icon.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/language_kit.dart';
import 'package:ngpidgin/globals.dart';

class LanguageScreen extends StatelessWidget {
  //
  //final ThemeMode themeMode;
  //const LanguageScreen(this.themeMode, {Key? key}) : super(key: key);
  static const TextStyle btnStyle =
      TextStyle(fontSize: 16, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final deviceBrightness = MediaQuery.of(context).platformBrightness;
    final isLight = deviceBrightness == Brightness.light;
    final themeMode = isLight ? ThemeMode.light : ThemeMode.dark;
    Color titleColor = isLight ? Palette.Charcoal : Palette.GreenLight;
    Color bodyColor = isLight ? Palette.Charcoal : Colors.white;

    void selectLang(Language lang) async {
      await SharedPreferencesUtil.setInt(
          SettingKeys.themeMode, ThemeMode.light.index);
      Globals.themeMode = themeMode;

      await SharedPreferencesUtil.setInt(
          SettingKeys.LanguagePreference, lang.index);

      Globals.languagePreference = lang;
      Globals.languageKit =
          await LanguageKit.initialize(Globals.languagePreference);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreen(themeMode);
      }));
    }

    return Scaffold(
      backgroundColor: isLight ? Palette.Lavendar : Palette.Charcoal,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Welcome,",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: titleColor)),
            Text("Please select your preffered language of interaction",
                style: TextStyle(fontSize: 15, color: bodyColor)),
            SizedBox(height: 30),
            ButtonIconRight("Pidgin", () => selectLang(Language.pidgin),
                width: double.infinity,
                icon: Icon(Icons.chevron_right_outlined, color: Colors.white),
                textStyle: btnStyle),
            ButtonIconRight("English", () => selectLang(Language.english),
                width: double.infinity,
                bgColor: Palette.Pale,
                textStyle: btnStyle),
          ],
        ),
      ),
    );
  }
}
