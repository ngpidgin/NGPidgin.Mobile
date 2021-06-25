import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/sentence_list.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';

class TranslatorScreen extends StatefulWidget {
  static var dataSource = List<String>.generate(100, (i) => "Sentences $i");

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  List<String> data = TranslatorScreen.dataSource;

  bool showSearch = false;
  bool sortAsc = true;

  var actionBtnStyle = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.all(0),
  ));

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      appBar: AppBar(
          backgroundColor: Palette.PrimaryColor,
          title: Row(
            children: [
              Text("Translator"),
              SizedBox(width: 10),
              Text("Social",
                  style: TextStyle(fontSize: 13, color: Palette.Lavendar))
            ],
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  showSearch = !showSearch;
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.sort_by_alpha, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (sortAsc) {
                      data.sort((a, b) => a.compareTo(a));
                      sortAsc = false;
                    }
                    // } else {
                    //   data = data.reversed.toList();
                    //   sortAsc = true;
                    // }
                  });
                })
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          showSearch
              ? Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextBoxField(
                      placeholder: "filter sentences sharp sharp",
                      icon: Icon(Icons.search),
                      paddingVertical: 0,
                      width: size.width * 0.85,
                      onChange: (text) {
                        setState(() {
                          data = TranslatorScreen.dataSource
                              .where((e) =>
                                  e.toLowerCase().contains(text.toLowerCase()))
                              .toList();
                        });
                      }))
              : Container(),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Palette.Lavendar,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SentenceList(data)))
        ],
      ),
    );
  }
}
