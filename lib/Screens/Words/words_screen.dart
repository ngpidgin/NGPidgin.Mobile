import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_list.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';

class WordsScreen extends StatefulWidget {
  static const List<Map<String, String>> data0 = [
    {'word': 'Hey world'},
    {'word': 'Area'},
  ];
  static var dataSource = List<String>.generate(1000, (i) => "Aje-Butter $i");

  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  @override
  Widget build(BuildContext context) {
    var data = WordsScreen.dataSource;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      appBar: AppBar(
        backgroundColor: Palette.PrimaryColor,
        title: Text("Words"),
        elevation: 0,
        actions: [Icon(Icons.sort)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 20),
              child: TextBoxField(
                  placeholder: "filter words sharp sharp",
                  icon: Icon(Icons.search),
                  paddingVertical: 0,
                  width: size.width * 0.85,
                  onChange: (text) {
                    setState(() {
                      data.clear();
                      data = WordsScreen.dataSource
                          .where((e) => e.contains(text))
                          .toList();
                    });
                  })),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Palette.Lavendar,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: WordList(data: data)))
        ],
      ),
    );
  }
}
