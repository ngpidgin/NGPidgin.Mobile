import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Dashboard/suggestion_screen.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';

class SearchResultEmpty extends StatelessWidget {
  const SearchResultEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Globals.languageKit.searchResultEmpty,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Image.asset("assets/imgs/osita_confused_01.jpg")),
            SizedBox(height: 20),
            Text(
              Globals.languageKit.searchResultSuggest,
              style: TextStyle(color: Palette.Pale),
            ),
            ButtonPill("Suggest", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SuggestionScreen()));
            }, bgColor: Palette.Pale, textStyle: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
