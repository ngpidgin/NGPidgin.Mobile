class DictionarySchema {
  static const String Words = "Words";
  static const String Sentences = "SentenceTranslations";
  static const String Tips = "Tips";
}

class WordModel {
  final String word;
  final String meaning;
  final String example;
  final String similar;
  final String pronunciation;
  final String datestamp;
  int isFavorite;

  WordModel(this.word, this.meaning, this.example, this.similar,
      this.pronunciation, this.datestamp, this.isFavorite);

  WordModel.create(
      {required this.word,
      required this.meaning,
      required this.example,
      required this.similar,
      required this.pronunciation,
      required this.datestamp,
      required this.isFavorite});

  WordModel.blank(
      {this.word = "",
      this.meaning = "",
      this.example = "",
      this.similar = "",
      this.pronunciation = "",
      this.datestamp = "",
      this.isFavorite = 1});

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
      json['word'],
      json['meaning'],
      json['example'],
      json['similar'],
      json['pronunciation'],
      json['datestamp'],
      0);

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'meaning': meaning,
      'example': example,
      'similar': similar,
      'pronunciation': pronunciation,
      'datestamp': datestamp,
      'isFavorite': isFavorite
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Word{word: $word, example: $example}';
  }
}

enum sentenceCategory {
  general,
  social,
  business,
  sports,
  religion,
  travels,
  food
}

class SentenceModel {
  final int category;
  final String sentence;
  final String translations;
  final String datestamp;
  int isFavorite;

  SentenceModel(this.category, this.sentence, this.translations, this.datestamp,
      this.isFavorite);

  SentenceModel.create(
      {required this.category,
      required this.sentence,
      required this.translations,
      required this.datestamp,
      required this.isFavorite});

  SentenceModel.blank(
      {this.category = 0,
      this.sentence = "",
      this.translations = "",
      this.datestamp = "",
      this.isFavorite = 0});

  factory SentenceModel.fromJson(Map<String, dynamic> json) => SentenceModel(
      json['category'],
      json['sentence'],
      json['translations'],
      json['datestamp'],
      0);

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'sentence': sentence,
      'translations': translations,
      'datestamp': datestamp,
      'isFavorite': isFavorite,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Word{sentence: $sentence, translations: $translations}';
  }

  static String getCategoryDesc(sentenceCategory category) {
    switch (category) {
      case sentenceCategory.general:
        return "General";
      case sentenceCategory.social:
        return "Social";
      case sentenceCategory.business:
        return "Business";
      case sentenceCategory.sports:
        return "Sports";
      case sentenceCategory.religion:
        return "Religion";
      case sentenceCategory.travels:
        return "Travels & Tours";
      case sentenceCategory.food:
        return "Food & Drinks";
      default:
        return ". . .";
    }
  }
}

enum favoriteType { all, word, sentence }

class FavoriteModel {
  final int type;
  final String content;

  FavoriteModel(this.type, this.content);

  FavoriteModel.create({required this.type, required this.content});

  Map<String, dynamic> toMap() {
    return {'type': type, 'content': content};
  }
}

class TipModel {
  String title;
  String content;
  bool isLoaded() => content.isEmpty == false;
  TipModel(this.title, this.content);

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content};
  }
}

class DataUpdateModel {
  bool hasUpdate;
  int words;
  int sentences;
  int stickers;
  int count;
  int updateVersion;
  String downloadUrl;

  DataUpdateModel(this.hasUpdate, this.words, this.sentences, this.stickers,
      this.count, this.updateVersion, this.downloadUrl);
}

String nullCleanup(String data) => data.isEmpty ? "N/A" : data;
String stripHtml(String htmlText) {
  htmlText = htmlText
      .replaceAll("<br>", "\n")
      .replaceAll("</br>", "\n")
      .replaceAll("</li>", "\n");
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlText.replaceAll(exp, '');
}
