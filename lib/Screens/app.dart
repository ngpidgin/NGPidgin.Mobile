import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/palette_helper.dart';
import 'package:ngpidgin/Screens/Dashboard/dashboard_screen.dart';
import 'package:ngpidgin/Screens/Favorite/favorite_screen.dart';
import 'package:ngpidgin/Screens/Translator/translator_screen.dart';
import 'package:ngpidgin/Screens/Words/words_screen.dart';

class AppNavigator extends StatefulWidget {
  @override
  AppNavigatorState createState() => AppNavigatorState();
}

class AppNavigatorState extends State<AppNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  final _parentScreens = [
    DashboardScreen(),
    WordsScreen(),
    TranslatorScreen(),
    FavoriteScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: () async {
              if (_navigatorKey.currentState!.canPop()) {
                _navigatorKey.currentState!.pop();
                return false;
              }
              return true;
            },
            child: _parentScreens[_currentIndex]),
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
                  Icons.volume_up_outlined,
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
