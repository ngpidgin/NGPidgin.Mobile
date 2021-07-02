import 'dart:io';

import 'package:flutter/services.dart';
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
}
