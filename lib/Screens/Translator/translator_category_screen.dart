import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/card_frame.dart';
import 'package:ngpidgin/Screens/Translator/translator_screen.dart';
import 'package:ngpidgin/constants.dart';

class TranslatorCategoryScreen extends StatelessWidget {
  const TranslatorCategoryScreen({Key? key}) : super(key: key);

  static var dataSource =
      List<String>.generate(1000, (i) => "Sentence to speak on day $i");

  void showList(String category) {
    // Navigator.push(context, MaterialPageRoute(builder: (x) {
    //   return SentenceList(dataSource);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white;

    void showList(String category) {
      Navigator.push(context, MaterialPageRoute(builder: (x) {
        return TranslatorScreen();
      }));
    }

    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(15, 60, 15, 30),
                child: Column(children: [
                  Text(
                    "Translator",
                    style: TextStyle(fontSize: 25, color: textColor),
                  ),
                  Text(
                    "Find translations to every day pidgin spoken all over Nigeria, with a mix of slangs and humor",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  ),
                ])),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Palette.Lavendar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                padding: EdgeInsets.only(bottom: 25, top: 25),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.forum_outlined, "Social",
                          onPressed: () => showList("Social")),
                      TranslatorCategoryCardFrame(
                          Icons.local_mall_rounded, "Business & Trade",
                          onPressed: () => showList("Business & Trade")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.sports_basketball_rounded, "Sports",
                          onPressed: () => showList("Sports")),
                      TranslatorCategoryCardFrame(
                          Icons.location_city_rounded, "Religion",
                          onPressed: () => showList("Religion"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TranslatorCategoryCardFrame(
                          Icons.map_outlined, "Travels & Tours",
                          onPressed: () => showList("Travels & Tours")),
                      TranslatorCategoryCardFrame(
                          Icons.ramen_dining_rounded, "Food & Drinks",
                          onPressed: () => showList("Food & Drinks"))
                    ],
                  )
                ])),
              ),
            )
          ]),
    );
  }
}
