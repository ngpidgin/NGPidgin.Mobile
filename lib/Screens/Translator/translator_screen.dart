import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/card_frame.dart';
import 'package:ngpidgin/constants.dart';

class TranslatorScreen extends StatelessWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  void showList(String category) {
    print(category);
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white;
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
                margin: EdgeInsets.only(bottom: 25),
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
