import 'package:flutter/material.dart';

enum Language { none, pidgin, english }

class AppInfo {
  static const Version = "2.0.0";
  static const VersionName = "FadaLang 2.0 (beta)";
  static const FullName = "Nigerian Pidgin Dictionary";
  static const CodeName = "NG Pidgin";
  static const SplashFooterText =
      "an open-source project (c) 2021\npowered by Dynamic Brain Systems";
}

class Fonts {
  static const Default = "Poppins";
}

class Palette {
  static const PrimaryColor = Color(0xFF4B9C7F);
  static const PrimaryAltColor = Color(0xFF00BFA6);
  static const PrimaryLightColor = Color(0xFFA7E3CE);
  static const PrimaryLightBrightColor = Color(0xFFD9FFF1);
  static const PrimaryDarkColor = Color(0xFF3B7A63);
  static const Lavendar = Color(0xFFE3E7F1);
  static const LightGray = Color(0xFFE3E3E3);
  static const PaleGreen = Colors.blueGrey;
}

class SettingKeys {
  static const LanguagePreference = "lang_pref";
  static const dailyTipTitle = "daily_tip_title";
  static const dailyTipContent = "daily_tip_content";
  static const databaseUpdateVersion = "database_version";
}

class ServiceEndpoints {
  static const DailyTip = "https://jsonkeeper.com/b/2CFJ";
  static const UpdateCheck = "https://jsonkeeper.com/b/YQGH";
}
