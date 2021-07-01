import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/Screens/Start/splash_loader.dart';
import 'package:ngpidgin/Screens/app.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/language_kit.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

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
  Future<void> loadDataset() async {
    await DatabaseHelper.initializeDb().then((value) async {
      final db = await DatabaseHelper.loadDatabase();
      List<Map<String, dynamic>> wMap =
          await db.query('Words', orderBy: "Word asc");

      Globals.wordDataset = List.generate(wMap.length, (i) {
        return WordModel.create(
            word: wMap[i]['Word'],
            meaning: wMap[i]['Meaning'],
            example: wMap[i]['Example'],
            similar: wMap[i]['Similar'] ?? "...",
            pronunciation: wMap[i]['Pronunciation'] ?? "...",
            datestamp: wMap[i]['Datestamp']);
      });
      wMap = [];

      List<Map<String, dynamic>> sMap = await db.query('SentenceTranslations');
      Globals.sentenceDataset = List.generate(sMap.length, (i) {
        return SentenceModel.create(
            category: sMap[i]['Category'],
            sentence: sMap[i]['Sentence'],
            translations: sMap[i]['Translations'],
            datestamp: sMap[i]['Datestamp']);
      });
      sMap = [];
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
