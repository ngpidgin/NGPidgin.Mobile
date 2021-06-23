import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Start/welcome_screen.dart';
import 'package:ngpidgin/components/button_right_icon.dart';
import 'package:ngpidgin/constants.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static const TextStyle btnStyle =
      TextStyle(fontSize: 16, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    void selectLang(Language lang) {
      print(lang.toString());

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreen();
      }));
    }

    return Scaffold(
      backgroundColor: Palette.Lavendar,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Welcome,",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text("Please select your preffered language of interaction",
                style: TextStyle(fontSize: 15)),
            SizedBox(height: 30),
            ButtonIconRight("Pidgin", () {
              selectLang(Language.pidgin);
            },
                width: double.infinity,
                icon: Icon(Icons.chevron_right_outlined, color: Colors.white),
                textStyle: btnStyle),
            ButtonIconRight("English", () {
              selectLang(Language.english);
            },
                width: double.infinity,
                bgColor: Palette.PaleGreen,
                textStyle: btnStyle),
          ],
        ),
      ),
    );
  }
}
