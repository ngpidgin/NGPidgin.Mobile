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

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Word{word: $word, example: $example}';
  }
}
