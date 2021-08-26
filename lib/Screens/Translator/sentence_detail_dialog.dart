import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/content_section.dart';
import 'package:ngpidgin/Screens/Components/action_section.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:ngpidgin/theme_extension.dart';

// ignore: must_be_immutable
class SentenceDetailDialog extends StatefulWidget {
  SentenceModel model;
  int index;
  bool isFavorite;
  bool sourceIsFav;
  SentenceDetailDialog(this.model, this.index,
      {this.isFavorite = false, this.sourceIsFav = false});

  @override
  _SentenceDetailDialogState createState() => _SentenceDetailDialogState();
}

class _SentenceDetailDialogState extends State<SentenceDetailDialog> {
  changeIndex(bool next) {
    setState(() {
      if (next) {
        if (widget.index == Globals.sentenceDataset.length - 1)
          // reset index to first item
          widget.index = 0;
        else
          widget.index++;
      } else {
        if (widget.index == 0)
          // reset index to last item
          widget.index = Globals.sentenceDataset.length - 1;
        else
          widget.index--;
      }

      widget.model = Globals.sentenceDataset[widget.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String shareContent =
        "Sentence: ${widget.model.sentence}\nTranslations: ${widget.model.translations}\n\nSource: ${AppInfo.FullName}";

    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).dialogColor1,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: size.height * 0.5,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [ContentSection(widget.model)],
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: ActionSection(
                  widget.index,
                  favoriteType.sentence,
                  widget.model.sentence,
                  widget.model.translations,
                  shareContent,
                  widget.isFavorite,
                  changeIndex: (next) => changeIndex(next),
                  showNav: !widget.sourceIsFav,
                ))
          ],
        ));
  }
}
