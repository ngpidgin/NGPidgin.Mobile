import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Components/action_section.dart';
import 'package:ngpidgin/Screens/Words/content_section.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class WordDetailDialog extends StatelessWidget {
  final WordModel model;
  final bool isFavorite;
  WordDetailDialog(this.model, {this.isFavorite = false});

  void toggleFavorite() {}

  @override
  Widget build(BuildContext context) {
    final String audioText = model.word + "..." + model.meaning;
    final String shareContent =
        "Word: ${model.word}\nMeaning: ${model.meaning}\n\nSource: ${AppInfo.FullName}";

    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ContentSection(model),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Palette.PrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: ActionSection(favoriteType.word, model.word, audioText,
                    shareContent, isFavorite, () => toggleFavorite))
          ],
        ));
  }
}
