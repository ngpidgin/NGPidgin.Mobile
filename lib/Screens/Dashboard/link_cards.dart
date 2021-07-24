import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngpidgin/Screens/Dashboard/card_frame.dart';
import 'package:ngpidgin/Screens/Dashboard/data_update_dialog.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/interactions.dart';
import 'package:ngpidgin/globals.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ngpidgin/models/dictionary_models.dart';

class QuickLinkSection extends StatefulWidget {
  @override
  _QuickLinkSectionState createState() => _QuickLinkSectionState();
}

class _QuickLinkSectionState extends State<QuickLinkSection> {
  int dataUpdateCount = 0;
  final Size cardSize = new Size(110, 130);

  @override
  void initState() {
    super.initState();

    if (Globals.dataUpdate == null) {
      updateCheck().then((value) {
        setState(() {
          if (value != null) {
            dataUpdateCount = value.count;
          }
        });
      });
    } else {
      dataUpdateCount = Globals.dataUpdate!.count;
    }
  }

  Future<DataUpdateModel?> updateCheck() async {
    bool hasError = false;

    try {
      http.Response response =
          await http.get(Uri.parse(ServiceEndpoints.UpdateCheck));
      if (response.statusCode == 200) {
        var decodedData = convert.jsonDecode(response.body)["data"];
        int w = decodedData["words"];
        int s = decodedData["sentences"];
        int count = w + s;
        if (count > 0) {
          Globals.dataUpdate =
              DataUpdateModel(true, w, s, count, decodedData["downloadUrl"]);
        }
      }
    } catch (e) {
      hasError = true;
    }

    if (hasError) return null;
    return Globals.dataUpdate;
  }

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
              dataUpdateCount > 0
                  ? DashboardCardFrame(
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
                            Text(
                                Globals.languageKit.dashboardSyncDesc
                                    .replaceAll(
                                        "{0}", dataUpdateCount.toString()),
                                style: TextStyle(fontSize: 10))
                          ]),
                      "Synchronize",
                      titleAlignment: Alignment.centerLeft, onPressed: () {
                      showDialog(
                          context: context,
                          barrierColor: Color(0x80000000),
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return DataUpdateDialog();
                          });
                    })
                  : Container(),
              DashboardCardFrame(
                  cardSize,
                  Image.asset("assets/icons/twitter_outline.png"),
                  "Twitter feed"),
              DashboardCardFrame(
                cardSize,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SvgPicture.asset("assets/icons/happy_sticker.svg"),
                  SizedBox(height: 10),
                  Text("Plenty memes & stickers",
                      style: TextStyle(fontSize: 10))
                ]),
                "Sticky box",
                titleAlignment: Alignment.centerLeft,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      Interactions.snacky("We still dey cook this feature.. "));
                },
              ),
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
