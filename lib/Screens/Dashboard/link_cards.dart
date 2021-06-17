import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ngpidgin/Screens/Dashboard/card_frame.dart';
import 'package:ngpidgin/constants.dart';

class QuickLinkSection extends StatelessWidget {
  final Size cardSize = new Size(110, 130);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: cardSize.height + 10,
            alignment: Alignment.center,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              DashboardCardFrame(
                  cardSize,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Aa",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Palette.PaleGreen)),
                        SizedBox(height: 10),
                        Text("We don add 83 new words",
                            style: TextStyle(fontSize: 10))
                      ]),
                  "Synchronize"),
              DashboardCardFrame(
                  cardSize,
                  Image.asset("assets/icons/twitter_outline.png"),
                  "Twitter feed"),
              DashboardCardFrame(
                  cardSize,
                  Icon(Icons.add,
                      size: cardSize.width * 0.6, color: Palette.PaleGreen),
                  "Suggest"),
              DashboardCardFrame(
                  cardSize,
                  Icon(Icons.money,
                      size: cardSize.width * 0.6, color: Palette.PaleGreen),
                  "Premium")
            ]),
          ),
        ],
      ),
    );
  }
}
