import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';

class DailyTipSection extends StatelessWidget {
  const DailyTipSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          boxShadow: [
            BoxShadow(
                color: Color(0x408F8F8F),
                blurRadius: 3,
                offset: Offset.fromDirection(1, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Tips",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
          Text(
              "Everyone has a plan until they get punched in the mouth. Then they are like 'oh shit', its different around here.",
              style: TextStyle(fontSize: 14)),
          SizedBox(height: 10),
          Row(
            children: [
              ButtonPill("Share", () {},
                  bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80),
              ButtonPill("View all", () {},
                  bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80)
            ],
          )
        ],
      ),
    );
  }
}
