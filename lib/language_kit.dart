import 'dart:convert';
import 'package:ngpidgin/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

class LanguageKit {
  LanguageKit();

  String welcomeIntro = "";
  String welcomeBtnText = "";
  String dashboardSearchPlaceholder = "";
  String dashboardDailyTips = "";
  String dashboardSyncDesc = "";
  String translatorCategoryDesc = "";

  LanguageKit.fromJson(Map<String, dynamic> json)
      : welcomeIntro = json['welcomeIntro'],
        welcomeBtnText = json['welcomeBtnText'],
        dashboardSearchPlaceholder = json['dashboardSearchPlaceholder'],
        dashboardDailyTips = json['dashboardDailyTips'],
        dashboardSyncDesc = json['dashboardSyncDesc'],
        translatorCategoryDesc = json['translatorCategoryDesc'];

  static Future<LanguageKit> initialize(Language lang) async {
    final content = await loadAsset(
        "assets/language_packs/${(lang == Language.pidgin ? "ng_pg" : "en_us")}.json");

    return LanguageKit.fromJson(json.decode(content));
  }
}
