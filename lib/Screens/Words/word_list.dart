import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/word_detail_screen.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';

class WordList extends StatelessWidget {
  final List<String> data;
  const WordList(this.data);

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
                          return WordDetailScreen(index, data[index]);
                        });

                    //   showGeneralDialog(
                    //       barrierColor: Colors.black.withOpacity(0.5),
                    //       transitionBuilder: (context, a1, a2, widget) {
                    //         return Transform.scale(
                    //           scale: a1.value,
                    //           child: Opacity(
                    //             opacity: a1.value,
                    //             child: WordDetailScreen(index, data[index]),
                    //           ),
                    //         );
                    //       },
                    //       transitionDuration: Duration(milliseconds: 150),
                    //       barrierDismissible: true,
                    //       barrierLabel: '',
                    //       context: context,
                    //       pageBuilder: (context, animation1, animation2) {
                    //         return Container();
                    //       });
                    // });
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
