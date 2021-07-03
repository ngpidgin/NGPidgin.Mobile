import 'dart:io';

import 'package:flutter/services.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String dbName = "dictionary_store.db";
  static const String dbAssetPath = "assets/datastore/" + dbName;

  static Future<bool> initializeDb() async {
    var dbPath = join((await getDatabasesPath()).toString(), dbName);
    var dbExist = await File(dbPath).exists();

    if (!dbExist) {
      // await deleteDatabase(dbPath);

      // clone the assets db into the device db store
      ByteData data = await rootBundle.load(dbAssetPath);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
      dbExist = true;
    }

    return dbExist;
  }

  static Future<Database> loadDatabase() async => openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'dictionary_store.db'),

        // When the database is first created, create a table to store dogs.
        // onCreate: (db, version) {
        //   // Run the CREATE TABLE statement on the database.
        //   return db.execute(
        //     'CREATE TABLE "Words" (`Word` TEXT NOT NULL, `Meaning` TEXT NOT NULL, `Example` TEXT, `Similar` TEXT, `Datestamp` TEXT, `Pronunciation` TEXT, PRIMARY KEY(`Word`))',
        //   );
        // },
        version: 1,
      );

  static loadDatasets() async {
    final db = await DatabaseHelper.loadDatabase();

    // load words
    List<Map<String, dynamic>> wMap =
        await db.query(DictionarySchema.Words, orderBy: "Word asc");
    Globals.wordDataset = List.generate(wMap.length, (i) {
      return WordModel.create(
          word: wMap[i]['Word'],
          meaning: wMap[i]['Meaning'],
          example: wMap[i]['Example'],
          similar: wMap[i]['Similar'] ?? "...",
          pronunciation: wMap[i]['Pronunciation'] ?? "...",
          datestamp: wMap[i]['Datestamp']);
    });
    wMap = [];

    // load sentences
    List<Map<String, dynamic>> sMap =
        await db.query(DictionarySchema.Sentences);
    Globals.sentenceDataset = List.generate(sMap.length, (i) {
      return SentenceModel.create(
          category: sMap[i]['Category'],
          sentence: sMap[i]['Sentence'],
          translations: sMap[i]['Translations'],
          datestamp: sMap[i]['Datestamp']);
    });
    sMap = [];

    // load favorites
    List<Map<String, dynamic>> fMap =
        await db.query(DictionarySchema.Favorites, orderBy: "Content asc");

    Globals.favoriteDataset = List.generate(fMap.length, (i) {
      return FavoriteModel.create(
          type: fMap[i]['Type'], content: fMap[i]['Content']);
    });
  }
}
