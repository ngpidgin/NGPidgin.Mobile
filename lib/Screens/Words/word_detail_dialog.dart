import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Components/action_section.dart';
import 'package:ngpidgin/Screens/Words/content_section.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

// ignore: must_be_immutable
class WordDetailDialog extends StatefulWidget {
  WordModel model;
  int index;
  bool isFavorite;
  bool sourceIsFav;
  WordDetailDialog(this.model, this.index,
      {this.isFavorite = false, this.sourceIsFav = false});

  @override
  _WordDetailDialogState createState() => _WordDetailDialogState();
}

class _WordDetailDialogState extends State<WordDetailDialog> {
  changeIndex(bool next) {
    setState(() {
      if (next) {
        if (widget.index == Globals.wordDataset.length - 1)
          // reset index to first item
          widget.index = 0;
        else
          widget.index++;
      } else {
        if (widget.index == 0)
          // reset index to last item
          widget.index = Globals.wordDataset.length - 1;
        else
          widget.index--;
      }

      widget.model = Globals.wordDataset[widget.index];
    });
  }

  @override
  initState() {
    if (widget.index == -1) {
      // source from dashboard auto-complete
      // widget.isFavorite = Globals.favoriteDataset.any((a) =>
      //     a.type == favoriteType.word.index &&
      //     a.content.toLowerCase() == widget.model.word.toLowerCase());
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final String audioText = widget.model.word + "..." + widget.model.meaning;
    final String shareContent =
        "Word: ${widget.model.word}\nMeaning: ${widget.model.meaning}\n\nSource: ${AppInfo.FullName}";

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
                      ContentSection(widget.model),
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
                child: ActionSection(
                  widget.index,
                  favoriteType.word,
                  widget.model.word,
                  audioText,
                  shareContent,
                  widget.isFavorite,
                  changeIndex: (next) => changeIndex(next),
                  showNav: !widget.sourceIsFav,
                ))
          ],
        ));
  }
}
