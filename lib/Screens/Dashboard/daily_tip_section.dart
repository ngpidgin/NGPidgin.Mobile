import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
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
  TipModel tip = TipModel("...", "Loading today's tip..");
  String shareContent = "";
  bool isSyncing = false;

  Future<void> get() async {
    if (Globals.dailyTip == null) {
      // load local tip
      String localTipTItle =
          await SharedPreferencesUtil.getString(SettingKeys.dailyTipTitle);
      String localTipContent =
          await SharedPreferencesUtil.getString(SettingKeys.dailyTipContent);

      if (localTipContent.isEmpty == false) {
        Globals.dailyTip = TipModel(localTipTItle, localTipContent);
      }
    }

    // check server for new tip
    if (!Globals.tipFetchComplete) {
      isSyncing = true;
      try {
        http.Response response =
            await http.get(Uri.parse("https://jsonkeeper.com/b/2CFJ"));
        if (response.statusCode == 200) {
          var decodedData = convert.jsonDecode(response.body)["data"];
          Globals.dailyTip =
              TipModel(decodedData["title"], decodedData["content"]);
          SharedPreferencesUtil.setString(
              SettingKeys.dailyTipTitle, Globals.dailyTip!.title);
          SharedPreferencesUtil.setString(
              SettingKeys.dailyTipContent, Globals.dailyTip!.content);

          setState(() {
            tip = Globals.dailyTip!;
          });

          Globals.tipFetchComplete = true;
          isSyncing = false;
        } else {
          //return 'failed';
        }
      } catch (e) {
        //return 'failed';
        isSyncing = false;
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
          isSyncing
              ? Text("checking for latest...",
                  style: TextStyle(
                      fontSize: FontSize.small.size,
                      fontStyle: FontStyle.italic,
                      color: Colors.red))
              : Container(),
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
