import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Settings/settings_screen.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  const TopNav({Key? key}) : super(key: key);

  Size get preferredSize {
    return new Size.fromHeight(60);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 40, 15, 0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Image.asset("assets/icons/app_icon.png", width: 40)),
            IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsScreen();
                  }));
                })
          ],
        ));
  }
}
