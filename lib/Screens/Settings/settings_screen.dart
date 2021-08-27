import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Settings/item_row.dart';
import 'package:ngpidgin/components/button_icon.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool stateDailyTip = false;
  bool stateAutoSync = false;
  String themeLabel = "Theme ";
  ThemeMode theme = Globals.themeMode!;

  @override
  void initState() {
    themeLabel += theme == ThemeMode.light ? "(Light)" : "(Dark)";
    super.initState();
  }

  void setTheme() async {
    setState(() {
      if (theme == ThemeMode.system || theme == ThemeMode.light) {
        theme = ThemeMode.dark;
      } else if (theme == ThemeMode.dark) {
        theme = ThemeMode.light;
      }
    });
    Globals.themeMode = theme;
    await SharedPreferencesUtil.setInt(SettingKeys.themeMode, theme.index);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp(showLoader: false)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: theme.primaryColor,
          elevation: 0),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: theme.canvasColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child:
                      Text("NOTIFICATIONS", style: theme.textTheme.headline5)),
              ItemRow(
                  "Subscribe to daily tips notifications",
                  Switch(
                      value: stateDailyTip,
                      onChanged: (x) {
                        setState(() {
                          stateDailyTip = x;
                        });
                      })),
              Divider(height: 1),
              ItemRow(
                  "Auto-download content updates",
                  Switch(
                      value: stateAutoSync,
                      onChanged: (x) {
                        setState(() {
                          stateAutoSync = x;
                        });
                      })),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Text("APP PREFERENCES",
                      style: theme.textTheme.headline5)),
              ItemRow(
                  "Preferred language",
                  DropdownButton<String>(
                    hint: Text("Pidgin"),
                    items: <String>["Pidgin", "English"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (x) {},
                  )),
              Divider(height: 1),
              ItemRow(
                  themeLabel,
                  TextButton(
                      child: Icon(Globals.themeMode == ThemeMode.dark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined),
                      onPressed: () => setTheme())),
            ],
          )),
    );
  }
}
