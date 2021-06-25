import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/language_kit.dart';

Language languagePreference = Language.none;
LanguageKit languageKit = LanguageKit();

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
