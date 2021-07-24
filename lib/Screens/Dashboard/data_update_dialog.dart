import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Components/action_section.dart';
import 'package:ngpidgin/Screens/Words/content_section.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';

// ignore: must_be_immutable
class DataUpdateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 150, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.downloading_outlined,
                color: Palette.PrimaryColor, size: 60),
            SizedBox(height: 15),
            Text("Downloading data updates..",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 30),
            Text("New words: ${Globals.dataUpdate!.words}"),
            Text("New sentences: ${Globals.dataUpdate!.sentences}"),
            SizedBox(height: 50),
            Text("Please wait for update to complete",
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
          ],
        ));
  }
}
