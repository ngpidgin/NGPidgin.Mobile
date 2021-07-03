import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_list.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class WordScreen extends StatefulWidget {
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  List<WordModel> data = Globals.wordDataset;
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
          title: Text("Words"),
          elevation: 0,
          leading: null,
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
                      data.sort((a, b) => a.word.compareTo(a.word));
                      sortAsc = false;
                    }
                    // } else {
                    //   data = data.reversed.toList();
                    //   sortAsc = true;
                    // }
                  });
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            showSearch
                ? Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextBoxField(
                        placeholder: "filter words sharp sharp",
                        icon: Icon(Icons.search),
                        paddingVertical: 0,
                        width: size.width * 0.85,
                        onChange: (text) {
                          setState(() {
                            data = Globals.wordDataset
                                .where((e) => e.word
                                    .toLowerCase()
                                    .contains(text.toLowerCase()))
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
                    child: WordList(data)))
          ],
        ));
  }
}