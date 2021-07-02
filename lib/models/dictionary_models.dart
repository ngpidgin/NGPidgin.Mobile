class WordModel {
  final String word;
  final String meaning;
  final String example;
  final String similar;
  final String pronunciation;
  final String datestamp;

  WordModel(this.word, this.meaning, this.example, this.similar,
      this.pronunciation, this.datestamp);

  WordModel.create(
      {required this.word,
      required this.meaning,
      required this.example,
      required this.similar,
      required this.pronunciation,
      required this.datestamp});

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'meaning': meaning,
      'example': example,
      'similar': similar,
      'pronunciation': pronunciation,
      'datestamp': datestamp,
    };
  }

  static WordModel? nullModel() => null;

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

  SentenceModel(
      this.category, this.sentence, this.translations, this.datestamp);

  SentenceModel.create(
      {required this.category,
      required this.sentence,
      required this.translations,
      required this.datestamp});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'sentence': sentence,
      'translations': translations,
      'datestamp': datestamp,
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
        return "Business & Trade";
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

String nullCleanup(String data) => data.isEmpty ? "N/A" : data;
String stripHtml(String htmlText) {
  htmlText = htmlText
      .replaceAll("<br>", "\n")
      .replaceAll("</br>", "\n")
      .replaceAll("</li>", "\n");
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlText.replaceAll(exp, '');
}
