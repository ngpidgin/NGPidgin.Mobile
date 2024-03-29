import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Dashboard/dashboard_screen.dart';
import 'package:ngpidgin/Screens/Words/word_screen.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/palette_helper.dart';

class BottomNavOld extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNavOld> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onChange(int index) {
      setState(() {
        currentIndex = index;
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        Widget page = DashboardScreen();
        switch (currentIndex) {
          case 0:
            page = DashboardScreen();
            break;
          case 1:
            page = WordScreen();
            break;
        }

        return page;
      }));
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      fixedColor: Palette.PrimaryColor,
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      onTap: (x) => onChange(x),
      items: [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
              color: Colors.blueGrey,
            )),
        BottomNavigationBarItem(
            label: "Words",
            icon: Icon(
              Icons.book_outlined,
              color: Colors.blueGrey,
            )),
        BottomNavigationBarItem(
            label: "Translator",
            icon: Icon(
              Icons.speaker_outlined,
              color: Colors.blueGrey,
            )),
        BottomNavigationBarItem(
            label: "Favorites",
            icon: Icon(
              Icons.favorite_border_outlined,
              color: fromHex("#FF5050"),
            ))
      ],
    );
  }
}
