import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart' as globals;
import 'package:ngpidgin/language_kit.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget screen = LanguageScreen();

  // @override
  // void initState() {
  //   super.initState();
  //   setFirstScreen();
  // }

  // void setFirstScreen() async {
  // final prefs = await SharedPreferences.getInstance();
  // final _lang = prefs.getInt(SettingKeys.LanguagePreference);

  // if (_lang != null) {
  //   globals.languagePreference = Language.values[_lang];
  //   setState(() {
  //     if (globals.languagePreference == Language.none)
  //       screen = LanguageScreen();
  //     else
  //       screen = AppNavigator();
  //   });

  //   globals.languageKit =
  //       await LanguageKit.initialize(globals.languagePreference);
  // }
  // }

  Future setFirstScreen() async {
    final _lang =
        await SharedPreferencesUtil.getInt(SettingKeys.LanguagePreference);

    if (_lang == null) {
      return LanguageScreen();
    }

    globals.languagePreference = Language.values[_lang];
    globals.languageKit =
        await LanguageKit.initialize(globals.languagePreference);

    if (globals.languagePreference == Language.none)
      return LanguageScreen();
    else
      return AppNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setFirstScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
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
                home: snapshot.data as Widget);
          }
        });
  }
}
