import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Widget icon;
  final Color? bgColor;
  final Function() onClick;

  ButtonIcon(this.icon, this.onClick, {Key? key, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: 45,
        height: 45,
        child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: bgColor ?? Theme.of(context).primaryColor,
                    alignment: Alignment.center),
                onPressed: onClick,
                child: icon)));
  }
}
