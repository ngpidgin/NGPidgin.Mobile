import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Dashboard/daily_tip_section.dart';
import 'package:ngpidgin/Screens/Dashboard/link_cards.dart';
import 'package:ngpidgin/Screens/Dashboard/search_section.dart';
import 'package:ngpidgin/Screens/components/top_navbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopNav(),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              SearchSection(),
              DailyTipSection(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: QuickLinkSection(),
              ),
            ],
          )),
        ));
  }
}
