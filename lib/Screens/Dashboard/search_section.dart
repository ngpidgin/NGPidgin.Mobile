import 'package:flutter/material.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 50),
      width: size.width,
      height: size.height * 0.35,
      decoration: BoxDecoration(
          color: Palette.PrimaryColor,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.5, 4.0),
              colors: <Color>[Palette.PrimaryColor, Colors.black],
              tileMode: TileMode.repeated)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(fontFamily: Fonts.Default),
                    children: [
                  TextSpan(
                      text: "  Search ",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  TextSpan(
                      text: "for words and sentences",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Palette.LightGray))
                ])),
            SizedBox(height: 10),
            TextBoxField(
              placeholder: "Wetin you dey find?",
              width: size.width * 0.8,
              icon: Icon(Icons.search),
            )
          ]),
    );
  }
}
