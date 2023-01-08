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

  // general
  static const Lavendar = Color(0xFFE3E7F1); // Color(0xFFCACFDC);
  static const LightGray = Color(0xFFE3E3E3);
  static const Pale = Colors.blueGrey;
  static const PaleDark = Color(0xFF363F43);

  // light-themed
  static const Green = Color(0xFF4B9C7F);
  static const GreenDark = Color(0xFF3B7A63);
  static const GreenLight = Color(0xFFA7E3CE);
  static const GreenLightBright = Color(0xFFD9FFF1);
  static const GreenAlt = Color(0xFF00BFA6);

  // dark-themed
  static const Charcoal = Color(0xFF22282C);
  static const CharcoalLight = Color(0xFF3F4449);
  static const CharcoalDark = Color(0xFF2D393F);
}

class SettingKeys {
  static const LanguagePreference = "lang_pref";
  static const dailyTipTitle = "daily_tip_title";
  static const dailyTipContent = "daily_tip_content";
  static const databaseUpdateVersion = "database_version";
  static const themeMode = "theme_mode";
  static const appUserName = "app_user_name";
  static const appUserLocation = "app_user_location";
}

class ServiceEndpoints {
  static const DailyTip =
      "https://firebasestorage.googleapis.com/v0/b/ngpidgindictionary.appspot.com/o/content%2Fdaily_tip.json?alt=media&token=d7517663-0521-44c0-8948-63c474ef18d2";
  static const UpdateCheck =
      "https://firebasestorage.googleapis.com/v0/b/ngpidgindictionary.appspot.com/o/content%2Fdata_update.json?alt=media&token=53581748-de35-4b69-93ee-bb8b4116024f";
}
