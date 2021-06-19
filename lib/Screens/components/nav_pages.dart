import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Dashboard/dashboard_screen.dart';
import 'package:ngpidgin/Screens/Translator/translator_screen.dart';
import 'package:ngpidgin/Screens/Words/words_screen.dart';

class NavPages {
  static const List<Widget> children = [
    DashboardScreen(),
    WordsScreen(),
    TranslatorScreen()
  ];

  List<Widget> getChildren() {
    return children;
  }
}
