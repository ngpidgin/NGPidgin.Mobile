import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/palette_helper.dart';
import 'package:ngpidgin/Screens/Dashboard/dashboard_screen.dart';
import 'package:ngpidgin/Screens/Favorite/favorite_screen.dart';
import 'package:ngpidgin/Screens/Translator/translator_category_screen.dart';
import 'package:ngpidgin/Screens/Words/word_screen.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:ngpidgin/extensions/db_helper.dart';

class AppNavigator extends StatefulWidget {
  @override
  AppNavigatorState createState() => AppNavigatorState();
}

class AppNavigatorState extends State<AppNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  final _parentScreens = [
    DashboardScreen(),
    WordScreen(),
    TranslatorCategoryScreen(),
    FavoriteScreen()
  ];

  void loadDataset() async {
    await DatabaseHelper.initializeDb().then((value) async {
      final db = await DatabaseHelper.loadDatabase();
      final List<Map<String, dynamic>> wMap =
          await db.query('Words', orderBy: "Word asc");

      Globals.wordDataset = List.generate(wMap.length, (i) {
        return WordModel.create(
            word: wMap[i]['Word'],
            meaning: wMap[i]['Meaning'],
            example: wMap[i]['Example'],
            similar: wMap[i]['Similar'] ?? "...",
            pronunciation: wMap[i]['Pronunciation'] ?? "...",
            datestamp: wMap[i]['Datestamp']);
      });

      final List<Map<String, dynamic>> sMap =
          await db.query('SentenceTranslations');
      Globals.sentenceDataset = List.generate(sMap.length, (i) {
        return SentenceModel.create(
            category: sMap[i]['Category'],
            sentence: sMap[i]['Sentence'],
            translations: sMap[i]['Translations'],
            datestamp: sMap[i]['Datestamp']);
      });
    }).onError((error, stackTrace) => null);
  }

  @override
  void initState() {
    super.initState();
    loadDataset();
  }

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
