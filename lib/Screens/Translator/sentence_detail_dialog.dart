import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/content_section.dart';
import 'package:ngpidgin/Screens/components/action_section.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class SentenceDetailDialog extends StatelessWidget {
  final SentenceModel model;
  final bool isFavorite;
  const SentenceDetailDialog(this.model, {this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String shareContent =
        "Sentence: ${model.sentence}\nTranslations: ${model.translations}\n\nSource: ${AppInfo.FullName}";
    void toggleFavorite() {}

    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: size.height * 0.5,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [ContentSection(model)],
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
                child: ActionSection(model.translations, shareContent,
                    isFavorite, () => toggleFavorite))
          ],
        ));
  }
}
