import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Components/top_navbar.dart';
import 'package:ngpidgin/Screens/Dashboard/daily_tip_section.dart';
import 'package:ngpidgin/Screens/Dashboard/link_cards.dart';
import 'package:ngpidgin/Screens/Dashboard/search_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: TopNav(),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
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
            )));
  }
}
