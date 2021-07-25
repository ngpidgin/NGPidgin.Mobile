import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBoxFrame extends StatelessWidget {
  final Widget content;
  final double width;
  final Color bgColor;
  final Color textColor;
  Widget? icon;
  Widget? suffixIcon;
  final bool rounded;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  ValueChanged<String>? onChange;

  TextBoxFrame(this.content,
      {Widget? icon,
      Widget? suffixIcon,
      this.width = double.infinity,
      this.bgColor = Colors.white,
      this.textColor = Colors.black,
      this.rounded = false,
      this.borderRadius = 30,
      this.paddingVertical = 2,
      this.paddingHorizontal = 15,
      this.marginLeft = 5,
      this.marginTop = 5,
      this.marginRight = 5,
      this.marginBottom = 5}) {
    this.icon = icon;
    this.suffixIcon = suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizontal),
        margin: EdgeInsets.fromLTRB(
            marginLeft, marginTop, marginRight, marginBottom),
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(rounded ? borderRadius : 6)),
        child: content);
  }
}
