import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Translator/sentence_detail_dialog.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';

class SentenceList extends StatelessWidget {
  final List<String> data;
  const SentenceList(this.data);

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                  highlightColor: Colors.white,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Text('${data[index]}')),
                  onTap: () {
                    showDialog(
                        context: context,
                        // barrierDismissible: true,
                        barrierColor: Color(0x99000000),
                        builder: (BuildContext context) {
                          return SentenceDetailDialog(index, data[index]);
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
        : Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wetin you dey find like this?",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Image.asset("assets/imgs/osita_confused_01.jpg"),
                  SizedBox(height: 20),
                  Text(
                    "But you fit suggest am sha!",
                    style: TextStyle(color: Palette.PaleGreen),
                  ),
                  ButtonPill("Suggest", () {},
                      bgColor: Palette.PaleGreen,
                      textStyle: TextStyle(color: Colors.white))
                ],
              ),
            ),
          );
  }
}