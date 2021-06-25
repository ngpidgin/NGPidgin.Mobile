import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class ContentSection extends StatelessWidget {
  final String word;
  final String meaning;
  final String example;
  final String similar;
  final String pronunciation;

  ContentSection(
      this.word, this.meaning, this.example, this.similar, this.pronunciation);

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
                Text("Word", style: titleStyle),
                SizedBox(height: 5),
                Text(word, style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text("Meaning", style: titleStyle),
                SizedBox(height: 5),
                Text(meaning,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15))
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
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Example", style: titleStyle),
                          SizedBox(height: 5),
                          Text(example),
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
                          Text(similar),
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
                          Text(pronunciation)
                        ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}