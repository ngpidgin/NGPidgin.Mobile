import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'dart:convert';
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
        var decodedData = jsonDecode(response.body)["data"];
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
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Globals.languageKit.dailyTips,
                style: theme.textTheme.headline3,
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
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Palette.PrimaryAltColor,
                                    )),
                                SizedBox(width: 15),
                                Text(Globals.languageKit.dailyTipsLoading,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey))
                              ],
                            ));
                      } else {
                        if (snapshot.hasData) {
                          return DailyTipMainSection(
                              theme, snapshot.data as TipModel, refreshData);
                        }

                        return Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            width: double.infinity,
                            child: Text(
                                Globals.languageKit.dailyTipsFetchFailed,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xFF1800306))));
                      }
                    })
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class DailyTipMainSection extends StatelessWidget {
  final ThemeData theme;
  final TipModel model;
  final Function refreshAction;
  const DailyTipMainSection(this.theme, this.model, this.refreshAction);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      model.isLoaded()
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(model.title, style: theme.textTheme.headline5),
              SizedBox(height: 5),
              SelectableText(model.content, style: theme.textTheme.bodyText1)
            ])
          : Container(),
      SizedBox(height: 10),
      Row(
        children: [
          model.isLoaded()
              ? ButtonPill(
                  "Share",
                  () => Share.share(
                      "Daily Tip: ${model.title}\n${model.content}\n\nSource: ${AppInfo.FullName}"),
                  bgColor: theme.canvasColor,
                  textColor: Colors.grey,
                  width: 80)
              : Container(),
          ButtonPill("Refresh", () {
            refreshAction();
          }, bgColor: theme.canvasColor, textColor: Colors.grey, width: 80)
        ],
      )
    ]);
  }
}
