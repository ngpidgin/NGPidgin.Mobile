import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Dashboard/background_filler.dart';
import 'package:ngpidgin/Screens/Dashboard/daily_tip_section.dart';
import 'package:ngpidgin/Screens/Dashboard/link_cards.dart';
import 'package:ngpidgin/Screens/Dashboard/search_section.dart';
import 'package:ngpidgin/Screens/components/top_navbar.dart';
import 'package:ngpidgin/Screens/components/bottom_navbar.dart';
import 'package:ngpidgin/constants.dart';

class DashboardScreenOld extends StatelessWidget {
  const DashboardScreenOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Palette.Lavendar,
        appBar: TopNav(),
        bottomNavigationBar: BottomNav(),
        body: Container(
            child: Stack(
          children: [
            Positioned(
                top: 80,
                child: Container(
                  width: size.width,
                  child: BackgroundFiller(size.width * 0.5, 120),
                )),
            Positioned(top: 0, child: SearchSection()),
            Positioned(top: 152, child: DailyTipSection()),
            Positioned(
              top: 360,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(25),
                child: QuickLinkSection(),
              ),
            )
          ],
        )));
  }
}
