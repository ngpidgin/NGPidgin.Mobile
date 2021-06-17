import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/components/bottom_navbar.dart';
import 'package:ngpidgin/Screens/components/top_navbar.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [Text("Words")],
        ),
      ),
    );
  }
}
