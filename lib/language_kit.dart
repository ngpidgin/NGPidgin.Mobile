import 'dart:convert';
import 'package:ngpidgin/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

class LanguageKit {
  LanguageKit();

  String welcome_intro = "";
  String welcome_btn_text = "";
  String dashboard_search_placeholder = "";
  String dashboard_daily_tips = "";
  String dashboard_sync_desc = "";

  LanguageKit.fromJson(Map<String, dynamic> json)
      : welcome_intro = json['welcome_intro'],
        welcome_btn_text = json['welcome_btn_text'],
        dashboard_search_placeholder = json['dashboard_search_placeholder'],
        dashboard_daily_tips = json['dashboard_daily_tips'],
        dashboard_sync_desc = json['dashboard_sync_desc'];

  static Future<LanguageKit> initialize(Language lang) async {
    final content = await loadAsset(
        "assets/language_packs/${(lang == Language.pidgin ? "ng_pg" : "en_us")}.json");

    return LanguageKit.fromJson(json.decode(content));
  }
}
