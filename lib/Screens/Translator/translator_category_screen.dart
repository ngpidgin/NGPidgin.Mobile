import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/card_frame.dart';
import 'package:ngpidgin/Screens/Translator/translator_screen.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class TranslatorCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white;

    void showList(sentenceCategory category) {
      Navigator.push(context, MaterialPageRoute(builder: (bc) {
        return TranslatorScreen(category);
      }));
    }

    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(15, 60, 15, 30),
                child: Column(children: [
                  Text(
                    "Translator",
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                  Text(
                    Globals.languageKit.translatorCategoryDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  ),
                ])),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Palette.Lavendar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                padding: EdgeInsets.only(bottom: 25, top: 25),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.forum_outlined,
                          SentenceModel.getCategoryDesc(
                              sentenceCategory.social),
                          onPressed: () => showList(sentenceCategory.social)),
                      TranslatorCategoryCardFrame(
                          Icons.local_mall_rounded,
                          SentenceModel.getCategoryDesc(
                              sentenceCategory.business),
                          onPressed: () => showList(sentenceCategory.business)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.sports_basketball_rounded,
                          SentenceModel.getCategoryDesc(
                              sentenceCategory.sports),
                          onPressed: () => showList(sentenceCategory.sports)),
                      TranslatorCategoryCardFrame(
                          Icons.location_city_rounded,
                          SentenceModel.getCategoryDesc(
                              sentenceCategory.religion),
                          onPressed: () => showList(sentenceCategory.religion))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.map_outlined,
                          SentenceModel.getCategoryDesc(
                              sentenceCategory.travels),
                          onPressed: () => showList(sentenceCategory.travels)),
                      TranslatorCategoryCardFrame(Icons.ramen_dining_rounded,
                          SentenceModel.getCategoryDesc(sentenceCategory.food),
                          onPressed: () => showList(sentenceCategory.food))
                    ],
                  )
                ])),
              ),
            )
          ]),
    );
  }
}
