import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:ngpidgin/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

late FirebaseMessaging messaging;

class MyApp extends StatefulWidget {
  final bool showLoader;
  MyApp({this.showLoader = true});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          future: Initiator.initApp(context),
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

class Initiator {
  static Future<void> loadDataset() async {
    await DatabaseHelper.initializeDb().then((dbExist) async {
      if (dbExist) {
        await DatabaseHelper.loadDatasets();
      } else {
        // show repair page
        // download db from server
      }
    }).onError((error, stackTrace) => null);
  }

  static Future<void> _messageHandler(RemoteMessage message) async {
    print('x-> ----------- background message ${message.notification!.body}');
  }

  static Future<void> initializeFirebase(BuildContext context) async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   // print("Firebase device token");
    //   // print(value);
    // });

    FirebaseMessaging.onBackgroundMessage(_messageHandler);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(
            'XXXXXXXXXXXXXXXXXXXXXXXXXXX background message ${message.notification!.body}');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Globals.dailyTip = TipModel(event.notification!.title.toString(),
          event.notification!.body.toString());

      LocalStorage.setString(
          SettingKeys.dailyTipTitle, Globals.dailyTip!.title);
      LocalStorage.setString(
          SettingKeys.dailyTipContent, Globals.dailyTip!.content);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        if (message.data.containsKey("type")) {
          if (message.data["type"] == "daily_tip")
            Globals.dailyTipFromNotication = true;
        }
      }

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             DashboardScreen(dailyTip: Globals.dailyTip!)));
    });
  }

  static Future<Widget> initApp(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    await loadDataset();

    // load theme preference
    int theme = await LocalStorage.getInt(SettingKeys.themeMode) ??
        ThemeMode.light.index;
    Globals.themeMode = ThemeMode.values[theme];

    // get language choice
    final _lang = await LocalStorage.getInt(SettingKeys.LanguagePreference);

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
        await LocalStorage.getInt(SettingKeys.databaseUpdateVersion) ?? 1;

    await initializeFirebase(context);

    if (Globals.languagePreference == Language.none)
      return LanguageScreen();
    else
      return AppNavigator();
  }
}
