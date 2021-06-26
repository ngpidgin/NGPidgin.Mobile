import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/language_kit.dart';

Language languagePreference = Language.none;
LanguageKit languageKit = LanguageKit();

MyGlobals myGlobals = MyGlobals();

class MyGlobals {
  late GlobalKey _scaffoldKey;
  MyGlobals() {
    _scaffoldKey = GlobalKey();
  }

  GlobalKey get scaffoldKey => _scaffoldKey;
}
