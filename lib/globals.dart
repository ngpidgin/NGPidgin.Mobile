import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/language_kit.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class Globals {
  static Language languagePreference = Language.none;
  static LanguageKit languageKit = LanguageKit();

  static List<WordModel> wordDataset = <WordModel>[];
  static List<SentenceModel> sentenceDataset = <SentenceModel>[];
  static TipModel? dailyTip;
  static DataUpdateModel? dataUpdate;
  static bool tipFetchComplete = false;
}
