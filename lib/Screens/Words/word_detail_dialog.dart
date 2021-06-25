import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/action_section.dart';
import 'package:ngpidgin/Screens/Words/content_section.dart';
import 'package:ngpidgin/constants.dart';

class WordDetailDialog extends StatelessWidget {
  final int id;
  final String word;

  // static const String meaning =
  //     "A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)..A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)..A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)";
  static const String meaning =
      "A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)";

  const WordDetailDialog(this.id, this.word);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // elevation: 0,
        // insetPadding: EdgeInsets.all(15),
        // backgroundColor: Colors.transparent,
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.60,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ContentSection(
                          word,
                          meaning,
                          "1. Jessica is an aje-butter, she will just faint under this hot Nothern sun\n2. This school na for aje-butter only",
                          "Aje, soft, butti",
                          "Aje butter"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: size.height * 0.11,
                decoration: BoxDecoration(
                    color: Palette.PrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: ActionSection(word, meaning))
          ],
        ));
  }
}
