import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Words/meaning_section.dart';
import 'package:ngpidgin/Screens/Words/example_section.dart';
import 'package:ngpidgin/Screens/components/bottom_navbar.dart';
import 'package:ngpidgin/constants.dart';

class WordDetail extends StatelessWidget {
  final int id;
  final String word;

  const WordDetail(this.id, this.word);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      appBar: AppBar(
          elevation: 0,
          title: Text(word,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white))),
      bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              MeaningSection(
                  word,
                  //"A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)..A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)..A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)"),
                  "A person born with silver spoon in a cool environment, from a rich or wellto do family mostly, soft in appearance and having a totally different life from their opposite (aje-kpako)"),
              Expanded(
                child: ExampleSection(
                    "1. Jessica is an aje-butter, she will just faint under this hot Nothern sun\n2. This school na for aje-butter only",
                    "Aje, soft, butti",
                    "Aje butter"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
