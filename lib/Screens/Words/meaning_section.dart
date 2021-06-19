import 'package:flutter/material.dart';

class MeaningSection extends StatelessWidget {
  final String word;
  final String meaning;

  MeaningSection(this.word, this.meaning);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 20),
      // decoration: BoxDecoration(color: Palette.PrimaryColor),
      padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(word,
          //     style: TextStyle(
          //         fontSize: 23,
          //         fontWeight: FontWeight.w500,
          //         color: Colors.white)),
          SizedBox(height: 15),
          Text(meaning,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18, color: Colors.white))
        ],
      ),
    );
  }
}
