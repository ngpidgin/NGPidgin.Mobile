import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/globals.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:share/share.dart';

class DailyTipSection extends StatefulWidget {
  const DailyTipSection({Key? key}) : super(key: key);

  @override
  _DailyTipSectionState createState() => _DailyTipSectionState();
}

class _DailyTipSectionState extends State<DailyTipSection> {
  TipModel tip =
      TipModel(0, "...", "Loading today's tip..", DateTime.now().toString());
  String shareContent = "";

  Future<void> get() async {
    if (Globals.tipDataset.length == 0) {
      // load all local tips
      final db = await DatabaseHelper.loadDatabase();
      List<Map<String, dynamic>> tMap =
          await db.query(DictionarySchema.Tips, orderBy: "Id DESC");
      Globals.tipDataset = List.generate(tMap.length, (i) {
        return TipModel.create(
            id: tMap[i]['Id'],
            title: tMap[i]['Title'],
            content: tMap[i]['Content'],
            datestamp: tMap[i]['Datestamp']);
      });

      setState(() {
        tip = Globals.tipDataset[0];
      });
    } else {
      setState(() {
        tip = Globals.tipDataset[0];
      });
    }

    if (!Globals.tipFetchComplete) {
      // check server for new tip
      try {
        http.Response response =
            await http.get(Uri.parse("https://jsonkeeper.com/b/30PL"));
        if (response.statusCode == 200) {
          Iterable decodedData = convert.jsonDecode(response.body)["data"];
          var list =
              List<TipModel>.from(decodedData.map((e) => TipModel.fromJson(e)));

          if (list.length > 0) {
            setState(() {
              tip = list[0];
            });
          }

          // save tip to database
          final db = await DatabaseHelper.loadDatabase();
          list.forEach((i) {
            if (!Globals.tipDataset
                .any((a) => a.title.toLowerCase() == i.title.toLowerCase())) {
              db.insert(DictionarySchema.Tips, i.toMap());
              Globals.tipDataset.insert(0, i);
            }
          });

          Globals.tipFetchComplete = true;
        } else {
          //return 'failed';
        }
      } catch (e) {
        //return 'failed';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    get();
  }

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
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
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
            Globals.languageKit.dashboardDailyTips,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
          Text(tip.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Palette.PaleGreen)),
          SelectableText(tip.content, style: TextStyle(fontSize: 14)),
          SizedBox(height: 10),
          Row(
            children: [
              ButtonPill(
                  "Share",
                  () => Share.share(
                      "Daily Tip: ${tip.title}\n${tip.content}\n\nSource: ${AppInfo.FullName}"),
                  bgColor: Palette.Lavendar,
                  textColor: Colors.grey,
                  width: 80),
              ButtonPill("Refresh", () {},
                  bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80),
            ],
          )
        ],
      ),
    );
  }
}
