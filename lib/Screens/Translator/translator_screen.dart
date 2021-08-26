import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/sentence_list.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class TranslatorScreen extends StatefulWidget {
  final sentenceCategory category;
  const TranslatorScreen(this.category);

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  List<SentenceModel> data = [];
  bool showSearch = false;
  bool sortAsc = true;

  @override
  void initState() {
    super.initState();
    data = Globals.sentenceDataset
        .where((e) => e.category == widget.category.index)
        .toList();
  }

  var actionBtnStyle = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.all(0),
  ));

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Translator"),
                Text(SentenceModel.getCategoryDesc(widget.category),
                    style: TextStyle(fontSize: 11, color: Palette.Lavendar))
              ]),
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
                      data.sort((a, b) => a.sentence.compareTo(b.sentence));
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
                          data = Globals.sentenceDataset
                              .where((e) => e.sentence
                                  .toLowerCase()
                                  .contains(text.toLowerCase()))
                              .toList();
                        });
                      }))
              : Container(),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: SentenceList(data)))
        ],
      ),
    );
  }
}
