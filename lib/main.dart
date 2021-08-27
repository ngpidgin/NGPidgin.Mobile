import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/Start/splash_loader.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/language_kit.dart';
import 'package:ngpidgin/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final bool showLoader;
  MyApp({this.showLoader = true});

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

    // other settings
    Globals.dataUpdateVersion =
        await SharedPreferencesUtil.getInt(SettingKeys.databaseUpdateVersion) ??
            1;

    int theme = await SharedPreferencesUtil.getInt(SettingKeys.themeMode) ??
        ThemeMode.light.index;
    Globals.themeMode = ThemeMode.values[theme];

    if (Globals.languagePreference == Language.none)
      return LanguageScreen();
    else
      return AppNavigator();
  }

  MaterialApp app(Widget homeWidget) => MaterialApp(
      title: AppInfo.FullName,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Globals.themeMode,
      home: homeWidget);

  @override
  Widget build(BuildContext context) {
    if (widget.showLoader) {
      return FutureBuilder(
          future: initApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashLoader();
            } else {
              return app(snapshot.data as Widget);
            }
          });
    } else {
      return app(AppNavigator());
    }
  }
}
