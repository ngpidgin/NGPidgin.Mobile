import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class ContentSection extends StatelessWidget {
  final WordModel model;
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Word", style: titleStyle),
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
                                    Clipboard.setData(
                                        ClipboardData(text: model.word));
                                  })))
                    ]),
                SizedBox(height: 5),
                SelectableText(model.word, style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text("Meaning", style: titleStyle),
                SizedBox(height: 5),
                Container(
                    transform: Matrix4.translationValues(-8, 0, 0),
                    child: Html(data: model.meaning, style: {
                      "body": Style(
                          fontSize: FontSize(15),
                          lineHeight: LineHeight(1.5),
                          textAlign: TextAlign.justify)
                    }))
              ],
            ),
          ),
          Divider(height: 0),
          Container(
            decoration: BoxDecoration(color: Color(0xFFF8F8F8)),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.fromLTRB(25, 0, 17, 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Example", style: titleStyle),
                          SizedBox(height: 5),
                          Container(
                            transform: Matrix4.translationValues(-8, 0, 0),
                            child: Html(data: model.example, style: {
                              "li": Style(padding: EdgeInsets.only(left: 0)),
                              "body": Style(lineHeight: LineHeight(1.5))
                            }),
                          )
                        ])),
                Divider(),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Similar words",
                            style: titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          SelectableText(nullCleanup(model.similar)),
                        ])),
                Divider(),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pronunciation", style: titleStyle),
                          SizedBox(height: 5),
                          Text(nullCleanup(model.pronunciation))
                        ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
