import 'package:ngpidgin/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonIconRight extends StatelessWidget {
  final String text;
  final Widget? icon;
  final double width;
  final Color bgColor;
  final Color textColor;
  final bool rounded;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  TextStyle? textStyle;
  final Function() onClick;

  ButtonIconRight(this.text, this.onClick,
      {Key? key,
      this.icon,
      this.width = 150,
      this.bgColor = Palette.PrimaryColor,
      this.textColor = Colors.white,
      this.rounded = false,
      this.borderRadius = 30,
      this.paddingVertical = 20,
      this.paddingHorizontal = 20,
      this.marginLeft = 5,
      this.marginTop = 5,
      this.marginRight = 5,
      this.marginBottom = 5,
      TextStyle? textStyle})
      : super(key: key) {
    this.textStyle = textStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            marginLeft, marginTop, marginRight, marginBottom),
        width: width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(rounded ? borderRadius : 6),
            child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            vertical: paddingVertical,
                            horizontal: paddingHorizontal)),
                    backgroundColor: MaterialStateProperty.all<Color>(bgColor)),
                onPressed: onClick,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: textStyle ?? TextStyle(color: textColor)),
                    icon ?? SizedBox()
                  ],
                ))));
  }
}
