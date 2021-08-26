import 'package:ngpidgin/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonPill extends StatelessWidget {
  final String text;
  final double width;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final double paddingVertical;
  final double paddingHorizontal;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  TextStyle? textStyle;
  final Function() onClick;

  ButtonPill(this.text, this.onClick,
      {Key? key,
      this.width = 150,
      this.bgColor = Palette.PrimaryColor,
      this.textColor = Colors.white,
      this.fontSize = 11,
      this.paddingVertical = 5,
      this.paddingHorizontal = 0,
      this.marginLeft = 5,
      this.marginTop = 5,
      this.marginRight = 5,
      this.marginBottom = 5,
      TextStyle? textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            marginLeft, marginTop, marginRight, marginBottom),
        width: width,
        child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: bgColor,
                    padding: EdgeInsets.symmetric(
                        vertical: paddingVertical,
                        horizontal: paddingHorizontal)),
                onPressed: onClick,
                child: Text(text,
                    style: textStyle ??
                        TextStyle(fontSize: fontSize, color: textColor)))));
  }
}
