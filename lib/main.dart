import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/Start/splash_loader.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/language_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> loadDataset() async {
    await DatabaseHelper.initializeDb().then((dbExist) async {
      if (dbExist) {
        await DatabaseHelper.loadDatasets();
      } else {
        // show repair page
        // download db from server
      }
    }).onError((error, stackTrace) => null);
  }

  Future initApp() async {
    await loadDataset();
    //await Future.delayed(Duration(seconds: 10));

    // get language choice
    final _lang =
        await SharedPreferencesUtil.getInt(SettingKeys.LanguagePreference);

    // ensure first-time user select a language
    if (_lang == null) {
      return LanguageScreen();
    }

    // load dataset for language kit
    Globals.languagePreference = Language.values[_lang];
    Globals.languageKit =
        await LanguageKit.initialize(Globals.languagePreference);

    if (Globals.languagePreference == Language.none)
      return LanguageScreen();
    else
      return AppNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashLoader();
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
