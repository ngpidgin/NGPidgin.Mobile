import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/search_result_empty.dart';
import 'package:ngpidgin/Screens/Words/word_detail_dialog.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class WordList extends StatelessWidget {
  final List<WordModel> data;
  const WordList(this.data);

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Text(data[index].word)),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.8),
                        builder: (BuildContext context) {
                          return WordDetailDialog(
                            data[index],
                            index,
                            isFavorite:
                                data[index].isFavorite == 1 ? true : false,
                          );
                        });
                  });
            },
            separatorBuilder: (context, index) {
              return Divider(color: Colors.grey, height: 1);
            },
          )
        : SearchResultEmpty();
  }
}
