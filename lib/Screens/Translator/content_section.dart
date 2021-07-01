import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class ContentSection extends StatelessWidget {
  final SentenceModel model;
  ContentSection(this.model);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.w500, color: Palette.PaleGreen);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sentence", style: titleStyle),
                SizedBox(height: 5),
                Text(model.sentence, style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text("Translations", style: titleStyle),
                SizedBox(height: 5),
                Text(model.translations,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }
}
