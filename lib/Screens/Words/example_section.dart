import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

class ExampleSection extends StatelessWidget {
  final String example;
  final String similar;
  final String pronunciation;

  const ExampleSection(this.example, this.similar, this.pronunciation);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(fontWeight: FontWeight.w500);

    return Container(
      // alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: Palette.Lavendar,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Example", style: titleStyle),
                      SizedBox(height: 5),
                      Text(example),
                    ])),
            Divider(),
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Similar words",
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(similar),
                    ])),
            Divider(),
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pronunciation", style: titleStyle),
                      SizedBox(height: 5),
                      Text(pronunciation)
                    ])),
          ],
        ),
      ),
    );
  }
}
