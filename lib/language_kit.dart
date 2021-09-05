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
  String dailyTips = "";
  String dailyTipsLoading = "";
  String dailyTipsFetchFailed = "";
  String dashboardSyncDesc = "";
  String translatorCategoryDesc = "";
  String favoriteAdded = "";
  String favoriteRemoved = "";
  String dataUpdateFooterDesc = "";
  String dataUpdateDownloading = "";
  String dataUpdateUpdating = "";
  String dataUpdateCompleted = "";
  String dataUpdateFailed = "";
  String searchResultEmpty = "";
  String searchResultSuggest = "";
  String noInternetConnection = "";

  LanguageKit.fromJson(Map<String, dynamic> json)
      : welcomeIntro = json['welcomeIntro'],
        welcomeBtnText = json['welcomeBtnText'],
        dashboardSearchPlaceholder = json['dashboardSearchPlaceholder'],
        dailyTips = json['dailyTips'],
        dailyTipsLoading = json['dailyTipsLoading'],
        dailyTipsFetchFailed = json['dailyTipsFetchFailed'],
        dashboardSyncDesc = json['dashboardSyncDesc'],
        favoriteAdded = json['favoriteAdded'],
        favoriteRemoved = json['favoriteRemoved'],
        translatorCategoryDesc = json['translatorCategoryDesc'],
        dataUpdateDownloading = json['dataUpdateDownloading'],
        dataUpdateUpdating = json['dataUpdateUpdating'],
        dataUpdateCompleted = json['dataUpdateCompleted'],
        dataUpdateFailed = json['dataUpdateFailed'],
        searchResultEmpty = json['searchResultEmpty'],
        searchResultSuggest = json['searchResultSuggest'],
        noInternetConnection = json['noInternetConnection'];

  static Future<LanguageKit> initialize(Language lang) async {
    final content = await loadAsset(
        "assets/language_packs/${(lang == Language.pidgin ? "ng_pg" : "en_us")}.json");

    return LanguageKit.fromJson(json.decode(content));
  }
}
