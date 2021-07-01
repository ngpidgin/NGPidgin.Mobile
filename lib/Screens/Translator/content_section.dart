import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
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
            padding: EdgeInsets.fromLTRB(25, 25, 17, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sentence", style: titleStyle),
                SizedBox(height: 5),
                SelectableText(model.sentence, style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Translations", style: titleStyle),
                      Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            child: Icon(Icons.copy_outlined,
                                size: 20, color: Palette.LightGray),
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: stripHtml(model.translations)));
                            },
                          ),
                        ),
                      )
                    ]),
                SizedBox(height: 5),
                Container(
                  transform: Matrix4.translationValues(-8, 0, 0),
                  child: Html(data: model.translations, style: {
                    "li": Style(padding: EdgeInsets.only(left: 0)),
                    "body": Style(
                        fontSize: FontSize(15), lineHeight: LineHeight(1.5))
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
