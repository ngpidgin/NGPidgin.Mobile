import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:share/share.dart';

class DailyTipSection extends StatefulWidget {
  @override
  _DailyTipSectionState createState() => _DailyTipSectionState();
}

class _DailyTipSectionState extends State<DailyTipSection> {
  Future<TipModel?> _future = Future<TipModel?>.value(Globals.dailyTip);

  @override
  void initState() {
    super.initState();

    setState(() {
      // load data only if local/online data has never been loaded
      if (Globals.dailyTip == null || !Globals.dailyTip!.isLoaded()) {
        _future = getOnlineTip();
      } else {
        _future = Future<TipModel?>.value(Globals.dailyTip);
      }
    });
  }

  Future<TipModel?> getLocalTip() async {
    if (Globals.dailyTip == null) {
      String title =
          await SharedPreferencesUtil.getString(SettingKeys.dailyTipTitle);
      String content =
          await SharedPreferencesUtil.getString(SettingKeys.dailyTipContent);

      if (content.isEmpty == false) {
        Globals.dailyTip = TipModel(title, content);
      }
    }
    return Globals.dailyTip;
  }

  Future<TipModel?> getOnlineTip() async {
    bool hasError = false;

    try {
      http.Response response =
          await http.get(Uri.parse(ServiceEndpoints.DailyTip));
      if (response.statusCode == 200) {
        var decodedData = convert.jsonDecode(response.body)["data"];
        Globals.dailyTip =
            TipModel(decodedData["title"], decodedData["content"]);
        SharedPreferencesUtil.setString(
            SettingKeys.dailyTipTitle, Globals.dailyTip!.title);
        SharedPreferencesUtil.setString(
            SettingKeys.dailyTipContent, Globals.dailyTip!.content);
      } else {
        //return 'failed';
        return getLocalTip();
      }
    } catch (e) {
      hasError = true;
    }

    if (hasError) return getLocalTip();
    return Globals.dailyTip;
  }

  Future<void> refreshData() async {
    setState(() {
      _future = getOnlineTip();
    });
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
          SizedBox(height: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: double.infinity,
                        child: Text("Loading daily tip..",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey)));
                  } else {
                    if (snapshot.hasData) {
                      return DailyTipMainSection(
                          snapshot.data as TipModel, refreshData);
                    }

                    return Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: double.infinity,
                        child: Text("Unable to get daily tip..",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.red)));
                  }
                })
          ])
        ],
      ),
    );
  }
}

class DailyTipMainSection extends StatelessWidget {
  final TipModel model;
  final Function refreshAction;
  const DailyTipMainSection(this.model, this.refreshAction);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      model.isLoaded()
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(model.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Palette.PaleGreen)),
              SelectableText(model.content, style: TextStyle(fontSize: 14)),
            ])
          : Text(
              "No saved tip found. Make sure you are connected to the internet to get fresh tips daily!",
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
      SizedBox(height: 10),
      Row(
        children: [
          model.isLoaded()
              ? ButtonPill(
                  "Share",
                  () => Share.share(
                      "Daily Tip: ${model.title}\n${model.content}\n\nSource: ${AppInfo.FullName}"),
                  bgColor: Palette.Lavendar,
                  textColor: Colors.grey,
                  width: 80)
              : Container(),
          ButtonPill("Refresh", () {
            refreshAction();
          }, bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80),
        ],
      )
    ]);
  }
}
