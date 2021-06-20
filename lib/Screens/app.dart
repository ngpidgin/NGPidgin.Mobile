import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/palette_helper.dart';
import 'package:ngpidgin/Screens/Dashboard/dashboard_screen.dart';
import 'package:ngpidgin/Screens/Favorites/favorites_screen.dart';
import 'package:ngpidgin/Screens/Translator/translator_screen.dart';
import 'package:ngpidgin/Screens/Words/words_screen.dart';

class AppNavigator extends StatefulWidget {
  @override
  AppNavigatorState createState() => AppNavigatorState();
}

class AppNavigatorState extends State<AppNavigator> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashboardScreen(),
    WordsScreen(),
    TranslatorScreen(),
    FavoritesScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          showUnselectedLabels: true,
          fixedColor: Palette.PrimaryColor,
          unselectedItemColor: Colors.blueGrey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          onTap: onTabTapped,
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
        ));
  }
}
