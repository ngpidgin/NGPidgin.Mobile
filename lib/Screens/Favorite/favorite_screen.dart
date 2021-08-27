import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Favorite/favorite_list.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FavoriteModel> data = [];
  List<WordModel> words = [];
  List<SentenceModel> sentences = [];
  bool firstLoadComplete = false;

  Future<void> loadDataset() async {
    if (!firstLoadComplete) {
      data = Globals.wordDataset
          .where((a) => a.isFavorite == 1)
          .map((e) => FavoriteModel(favoriteType.word.index, e.word))
          .toList();
      firstLoadComplete = true;
    }
  }

  bool sortAsc = true;
  bool wordTabActive = true;
  bool sentenceTabActive = false;

  var actionBtnStyle = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.all(0),
  ));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    Color activeSelectionBg = theme.primaryColorLight;
    Color inactiveSelectionBg = Palette.GreenDark;
    Color activeSelectionText = Palette.GreenDark;
    Color inactiveSelectionText = Palette.PrimaryLightColor;

    return Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          title: Text("Favorites"),
          elevation: 0,
          leading: null,
          actions: [
            IconButton(
                icon: Icon(Icons.sort_by_alpha, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (sortAsc) {
                      if (wordTabActive)
                        words.sort((a, b) => a.word.compareTo(b.word));
                      else
                        sentences
                            .sort((a, b) => a.sentence.compareTo(b.sentence));

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
                          data = Globals.wordDataset
                              .where((a) => a.isFavorite == 1)
                              .map((e) => FavoriteModel(
                                  favoriteType.word.index, e.word))
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
                          data = Globals.sentenceDataset
                              .where((a) => a.isFavorite == 1)
                              .map((e) => FavoriteModel(
                                  favoriteType.sentence.index, e.sentence))
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
                              color: theme.canvasColor,
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
