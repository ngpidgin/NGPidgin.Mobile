import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Favorite/favorite_list.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FavoriteModel> data = [];
  bool firstLoadComplete = false;

  Future<void> loadDataset() async {
    if (Globals.favoriteDataset.length == 0) {
      final db = await DatabaseHelper.loadDatabase();
      List<Map<String, dynamic>> fMap =
          await db.query(DictionarySchema.Favorites, orderBy: "Content asc");

      Globals.favoriteDataset = List.generate(fMap.length, (i) {
        return FavoriteModel.create(
            type: fMap[i]['Type'], content: fMap[i]['Content']);
      });
    }

    if (!firstLoadComplete) {
      data = Globals.favoriteDataset
          .where((a) => a.type == favoriteType.word.index)
          .toList();
      firstLoadComplete = true;
    }
  }

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
                          data = Globals.favoriteDataset
                              .where((a) => a.type == favoriteType.word.index)
                              .toList();
                        });
                      },
                      bgColor: wordTabActive
                          ? activeSelectionBg
                          : inactiveSelectionBg,
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
                          data = Globals.favoriteDataset
                              .where(
                                  (a) => a.type == favoriteType.sentence.index)
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
                          child: FutureBuilder(
                              future: loadDataset(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                          color: Palette.PrimaryColor));
                                } else {
                                  return FavoriteList(data);
                                }
                              }))),
                ],
              ),
            ))
          ],
        ));
  }
}
