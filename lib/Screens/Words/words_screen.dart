import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_list.dart';
import 'package:ngpidgin/constants.dart';

class WordsScreen extends StatelessWidget {
  static const List<Map<String, String>> data0 = [
    {'word': 'Hey world'},
    {'word': 'Area'},
  ];

  final data = List<String>.generate(10000, (i) => "Espinosal 00$i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.PrimaryColor,
        title: Text("Words"),
        actions: [Icon(Icons.sort_by_alpha_outlined)],
      ),
      body: Container(child: WordList(data: data)),
    );
  }
}
