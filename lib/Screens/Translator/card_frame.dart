import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class TranslatorCategoryCardFrame extends StatelessWidget {
  final IconData icon;
  final String title;
  final Alignment? titleAlignment;
  final Function()? onPressed;
  TranslatorCategoryCardFrame(this.icon, this.title,
      {this.titleAlignment, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Size size = new Size(150, 150);

    return Container(
      height: size.height,
      width: size.width,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.only(right: 5),
      child: Card(
          child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.6,
                  child: Icon(
                    icon,
                    color: Palette.PaleGreen,
                    size: 70,
                  )),
              Container(
                  alignment: titleAlignment ?? Alignment.center,
                  height: size.height * 0.125,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
