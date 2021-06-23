import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart' as globals;
import 'package:ngpidgin/language_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget screen = LanguageScreen();

  @override
  void initState() {
    super.initState();
    setFirstScreen();
  }

  void setFirstScreen() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove(SettingKeys.LanguagePreference);
    final _lang = prefs.getInt(SettingKeys.LanguagePreference);

    if (_lang != null) {
      globals.languagePreference = Language.values[_lang];
      setState(() {
        if (globals.languagePreference == Language.none)
          screen = LanguageScreen();
        else
          screen = AppNavigator();
      });

      globals.languageKit =
          await LanguageKit.initialize(globals.languagePreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppInfo.FullName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Colors.white,
            // primarySwatch: Colors.yellow,
            accentColor: Palette.PrimaryAltColor,
            canvasColor: Palette.Lavendar,
            appBarTheme: AppBarTheme(color: Colors.transparent),
            fontFamily: Fonts.Default),
        home: screen);
  }
}
