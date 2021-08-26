import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_detail_dialog.dart';
import 'package:ngpidgin/components/textbox_frame.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 50),
      width: size.width,
      height: size.height * 0.35,
      decoration: Theme.of(context).brightness == Brightness.light
          ? BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1.5, 5.5),
                  colors: <Color>[Theme.of(context).primaryColor, Colors.black],
                  tileMode: TileMode.repeated))
          : BoxDecoration(),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(fontFamily: Fonts.Default),
                    children: [
                  TextSpan(
                      text: " Search ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: "for words and sentences",
                      style: TextStyle(fontWeight: FontWeight.w300))
                ])),
            SizedBox(height: 10),
            TextBoxFrame(Autocomplete<WordModel>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<WordModel>.empty();
                }
                return Globals.wordDataset.where((e) {
                  return e.word
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (WordModel selection) {
                showDialog(
                    context: context,
                    barrierColor: Color(0x99000000),
                    builder: (BuildContext context) {
                      return WordDetailDialog(selection, -1,
                          isFavorite: selection.isFavorite == 1 ? true : false,
                          sourceIsFav: true);
                    });
              },
              displayStringForOption: (item) => item.word,
              fieldViewBuilder: (context, controller, focusNode, onSumbit) {
                return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                        hintText:
                            Globals.languageKit.dashboardSearchPlaceholder,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search)));
              },

              // optionsViewBuilder: (context, onSelected, options) => Align(
              //       alignment: Alignment.topLeft,
              //       child: Material(
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.vertical(
              //               bottom: Radius.circular(4.0)),
              //         ),
              //         child: Container(
              //           decoration: BoxDecoration(color: Palette.Lavendar),
              //           height: 300,
              //           width: 400,
              //           child: ListView.builder(
              //             padding: EdgeInsets.zero,
              //             itemCount: options.length,
              //             shrinkWrap: false,
              //             itemBuilder: (BuildContext context, int index) {
              //               final WordModel option = options.elementAt(index);
              //               return InkWell(
              //                 onTap: () => onSelected(option),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(16.0),
              //                   child: Text(option.word),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ))
            ))
          ]),
    );
  }
}
