import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/sentence_detail_dialog.dart';
import 'package:ngpidgin/Screens/Words/word_detail_dialog.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/interactions.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class FavoriteList extends StatelessWidget {
  final List<FavoriteModel> data;
  const FavoriteList(this.data);

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                  highlightColor: Colors.white,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Text(data[index].content)),
                  onTap: () {
                    // show dialog for item type
                    // first, fetch the item from the global list
                    if (data[index].type == favoriteType.word.index) {
                      WordModel item = Globals.wordDataset.firstWhere(
                          (a) =>
                              a.word.toLowerCase() ==
                              data[index].content.toLowerCase(),
                          orElse: () => WordModel.blank());

                      if (item.word.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            Interactions.snacky("Word not found.."));
                      } else {
                        showDialog(
                            context: context,
                            barrierColor: Color(0x99000000),
                            builder: (BuildContext dialogContext) =>
                                WordDetailDialog(
                                  item,
                                  -1,
                                  isFavorite: true,
                                  sourceIsFav: true,
                                ));
                      }
                    } else {
                      SentenceModel item = Globals.sentenceDataset.firstWhere(
                          (a) =>
                              a.sentence.toLowerCase() ==
                              data[index].content.toLowerCase(),
                          orElse: () => SentenceModel.blank());

                      if (item.sentence.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            Interactions.snacky("Sentence not found.."));
                      } else {
                        showDialog(
                            context: context,
                            barrierColor: Color(0x99000000),
                            builder: (BuildContext dialogContext) =>
                                SentenceDetailDialog(
                                  item,
                                  -1,
                                  isFavorite: true,
                                  sourceIsFav: true,
                                ));
                      }
                    }
                  });
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 1,
              );
            },
          )
        : Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wetin you dey find like this?",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Image.asset("assets/imgs/osita_confused_01.jpg"),
                  SizedBox(height: 20),
                  Text(
                    "But you fit suggest am sha!",
                    style: TextStyle(color: Palette.PaleGreen),
                  ),
                  ButtonPill("Suggest", () {},
                      bgColor: Palette.PaleGreen,
                      textStyle: TextStyle(color: Colors.white))
                ],
              ),
            ),
          );
  }
}
