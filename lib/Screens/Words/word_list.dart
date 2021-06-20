import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_detail.dart';

class WordList extends StatelessWidget {
  final List<String> data;
  const WordList(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          highlightColor: Colors.white,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text('${data[index]}')),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WordDetail(index, data[index]);
            }));
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey,
          height: 1,
        );
      },
    );
  }
}
