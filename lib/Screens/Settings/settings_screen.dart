import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Settings/item_row.dart';
import 'package:ngpidgin/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool stateDailyTip = false;
  bool stateAutoSync = false;
  String theme = "default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Text("MANAGE NOTIFICATIONS",
                      style: TextStyle(
                          color: Palette.Pale, fontWeight: FontWeight.w500))),
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
              Divider(height: 1),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Text("APP PREFERENCES",
                      style: TextStyle(
                          color: Palette.Pale, fontWeight: FontWeight.w500))),
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
                  "Theme",
                  TextButton(
                      child: Icon(theme == "default"
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined),
                      onPressed: () {
                        setState(() {
                          theme = theme == "default" ? "dark" : "default";
                        });
                      })),
              Divider(height: 1),
            ],
          )),
    );
  }
}
