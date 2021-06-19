import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Splash/splash_screen.dart';
import 'package:ngpidgin/Screens/Start/start_screen.dart';
import 'package:ngpidgin/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pidgin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          accentColor: Palette.PrimaryAltColor,
          canvasColor: Palette.Lavendar,
          appBarTheme: AppBarTheme(color: Colors.transparent),
          fontFamily: "Poppins"),
      home: StartScreen(),
    );
  }
}
