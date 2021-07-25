import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:sqflite/sqflite.dart';

enum updateProgress { downloading, updating, completed }

class UpdateMap {
  final List<WordModel> words;
  final List<SentenceModel> sentences;

  UpdateMap(this.words, this.sentences);
}

// ignore: must_be_immutable
class DataUpdateDialog extends StatefulWidget {
  @override
  _DataUpdateDialogState createState() => _DataUpdateDialogState();
}

class _DataUpdateDialogState extends State<DataUpdateDialog> {
  updateProgress progress = updateProgress.downloading;
  String progressTitle = "Downloading data updates..";

  @override
  void initState() {
    super.initState();

    download().then((content) {
      if (content != null) {
        setState(() {
          progress = updateProgress.updating;
          progressTitle = "Updating database..";
        });

        update(content).then((value) {
          if (value) {
            setState(() {
              progress = updateProgress.completed;
              progressTitle = "Update completed!";
            });

            SharedPreferencesUtil.setInt(SettingKeys.databaseUpdateVersion,
                Globals.dataUpdate!.updateVersion);
          }
        });
      }
    });
  }

  Future<UpdateMap?> download() async {
    late List<WordModel> words = [];
    late List<SentenceModel> sentences = [];

    http.Response response =
        await http.get(Uri.parse(Globals.dataUpdate!.downloadUrl));
    if (response.statusCode == 200) {
      var wordStr = jsonDecode(response.body)["words"];
      if (wordStr != null) {
        var wMap = wordStr.cast<Map<String, dynamic>>();
        words =
            wMap.map<WordModel>((json) => WordModel.fromJson(json)).toList();
      }

      var sentenceStr = jsonDecode(response.body)["sentences"];
      if (sentenceStr != null) {
        var sMap = sentenceStr.cast<Map<String, dynamic>>();
        sentences = sMap
            .map<SentenceModel>((json) => SentenceModel.fromJson(json))
            .toList();
      }
    }

    if (words.length > 0 || sentences.length > 0)
      return UpdateMap(words, sentences);
    else
      return null;
  }

  Future<bool> update(UpdateMap content) async {
    var db = await DatabaseHelper.loadDatabase();

    if (content.words.length > 0) {
      Batch batch = db.batch();
      for (var row in content.words) {
        batch.insert(DictionarySchema.Words, row.toMap());
      }
      batch.commit(noResult: true);
    }

    if (content.sentences.length > 0) {
      Batch batch = db.batch();
      for (var row in content.sentences) {
        batch.insert(DictionarySchema.Sentences, row.toMap());
      }
      batch.commit(noResult: true);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 150, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (progress == updateProgress.downloading ||
                progress == updateProgress.updating)
              CircularProgressIndicator(color: Palette.PrimaryColor)
            else
              Icon(Icons.check_circle_rounded,
                  color: Palette.PrimaryColor, size: 60),
            SizedBox(height: 15),
            Text(progressTitle, style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UpdateItem("Words", Globals.dataUpdate!.words),
                      UpdateItem("Sentences", Globals.dataUpdate!.sentences),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UpdateItem("Stickers", Globals.dataUpdate!.stickers),
                      ])
                ])),
            SizedBox(height: 50),
            if (progress == updateProgress.completed)
              ButtonPill("Close", () {
                Navigator.of(context).pop(true);
              }, bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80)
            else
              Text("Please wait for update to complete",
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic))
          ],
        ));
  }
}

class UpdateItem extends StatelessWidget {
  final String title;
  final int count;
  const UpdateItem(this.title, this.count);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Palette.PaleGreen)),
        Text(count.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ],
    );
  }
}
