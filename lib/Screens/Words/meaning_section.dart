import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_icon.dart';
import 'package:ngpidgin/constants.dart';

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
              style: TextStyle(fontSize: 18, color: Colors.white)),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ButtonIcon(
                    Icon(Icons.volume_up,
                        color: Palette.PrimaryLightBrightColor),
                    () {}),
                ButtonIcon(
                    Icon(Icons.share_outlined,
                        color: Palette.PrimaryLightBrightColor),
                    () {}),
                ButtonIcon(
                    Icon(Icons.favorite_outline,
                        color: Palette.PrimaryLightBrightColor),
                    () {}),
                // ButtonIcon(
                //     Icon(Icons.favorite, color: Color(0xFFFB4E43)), () {}),
                SizedBox(width: 20),
                ButtonIcon(
                    Icon(Icons.chevron_left, color: Palette.PrimaryColor),
                    () {},
                    bgColor: Palette.PrimaryLightBrightColor),
                ButtonIcon(
                    Icon(Icons.chevron_right, color: Palette.PrimaryColor),
                    () {},
                    bgColor: Palette.PrimaryLightBrightColor)
              ]))
        ],
      ),
    );
  }
}
