import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Favorite/favorite_list.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/components/textbox_field.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FavoriteModel> dataSource = [];
  List<FavoriteModel> data = [];

  void loadDataset() async {
    final db = await DatabaseHelper.loadDatabase();
    List<Map<String, dynamic>> fMap =
        await db.query('Favorites', orderBy: "Content asc");

    dataSource = List.generate(fMap.length, (i) {
      return FavoriteModel.create(
          type: fMap[i]['Type'], content: fMap[i]['Content']);
    });

    setState(() {
      data =
          dataSource.where((a) => a.type == favoriteType.word.index).toList();
    });
  }

  @override
  initState() {
    super.initState();
    loadDataset();
  }

  bool showSearch = false;
  bool sortAsc = true;
  bool wordTabActive = true;
  bool sentenceTabActive = false;
  Color activeSelectionBg = Palette.PrimaryLightBrightColor;
  Color inactiveSelectionBg = Palette.PrimaryDarkColor;
  Color activeSelectionText = Palette.PaleGreen;
  Color inactiveSelectionText = Palette.PrimaryLightBrightColor;

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
        title: Text("Favorites"),
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
                    data.sort((a, b) => a.content.compareTo(b.content));
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
                      placeholder: "filter favorites sharp sharp",
                      icon: Icon(Icons.search),
                      paddingVertical: 0,
                      width: size.width * 0.85,
                      onChange: (text) {
                        setState(() {
                          data = dataSource
                              .where((e) => e.content
                                  .toLowerCase()
                                  .contains(text.toLowerCase()))
                              .toList();
                        });
                      }))
              : Container(),
          Expanded(
              child: Container(
            height: size.height,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Button(
                    "Words",
                    () {
                      setState(() {
                        wordTabActive = true;
                        sentenceTabActive = false;
                        data = dataSource
                            .where((a) => a.type == favoriteType.word.index)
                            .toList();
                      });
                    },
                    bgColor:
                        wordTabActive ? activeSelectionBg : inactiveSelectionBg,
                    textColor: wordTabActive
                        ? activeSelectionText
                        : inactiveSelectionText,
                    paddingVertical: 0,
                    width: 120,
                  ),
                  Button(
                    "Sentences",
                    () {
                      setState(() {
                        wordTabActive = false;
                        sentenceTabActive = true;
                        data = dataSource
                            .where((a) => a.type == favoriteType.sentence.index)
                            .toList();
                      });
                    },
                    bgColor: sentenceTabActive
                        ? activeSelectionBg
                        : inactiveSelectionBg,
                    textColor: sentenceTabActive
                        ? activeSelectionText
                        : inactiveSelectionText,
                    paddingVertical: 0,
                    width: 120,
                  )
                ]),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Palette.Lavendar,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: FavoriteList(data))),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
