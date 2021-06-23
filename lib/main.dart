import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/language_screen.dart';
import 'package:ngpidgin/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppInfo.FullName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.blue,
            accentColor: Palette.PrimaryAltColor,
            canvasColor: Palette.Lavendar,
            appBarTheme: AppBarTheme(color: Colors.transparent),
            fontFamily: "Poppins"),
        home: LanguageScreen());
  }
}
