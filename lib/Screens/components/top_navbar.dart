import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  const TopNav({Key? key}) : super(key: key);

  Size get preferredSize {
    return new Size.fromHeight(60);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Palette.PrimaryColor,
      leading: IconButton(
        icon: Icon(Icons.list),
        onPressed: () => {},
      ),
      title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "9ja",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Palette.PrimaryLightColor)),
            TextSpan(
                text: "Pidgin",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lime))
          ])),
      actions: [Icon(Icons.settings), SizedBox(width: 20)],
    );
  }
}
