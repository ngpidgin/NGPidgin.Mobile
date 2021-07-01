import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/language_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database and store the reference.
  // final database = openDatabase(
  //   // Set the path to the database. Note: Using the `join` function from the
  //   // `path` package is best practice to ensure the path is correctly
  //   // constructed for each platform.
  //   join(await getDatabasesPath(), 'ngpidgin_database.db'),

  //   // When the database is first created, create a table to store dogs.
  //   onCreate: (db, version) {
  //     // Run the CREATE TABLE statement on the database.
  //     return db.execute(
  //       'CREATE TABLE "Words" (`Word` TEXT NOT NULL, `Meaning` TEXT NOT NULL, `Example` TEXT, `Similar` TEXT, `Datestamp` TEXT, `Pronunciation` TEXT, PRIMARY KEY(`Word`))',
  //     );
  //   },
  // );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
