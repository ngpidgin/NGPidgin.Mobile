import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/sentence_detail_dialog.dart';
import 'package:ngpidgin/Screens/Words/search_result_empty.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

class SentenceList extends StatelessWidget {
  final List<SentenceModel> data;
  const SentenceList(this.data);

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
                      child: Text(data[index].sentence)),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: Color(0x99000000),
                        builder: (BuildContext context) {
                          return SentenceDetailDialog(data[index], index);
                        });
                  });
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 1,
              );
            },
          )
        : SearchResultEmpty();
  }
}
