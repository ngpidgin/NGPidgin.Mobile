import 'package:flutter/material.dart';
import 'package:ngpidgin/Screens/Settings/item_row.dart';
import 'package:ngpidgin/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool state_dailyTip = false;
  bool state_autoSync = false;
  String theme = "default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.PrimaryColor,
      appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Palette.PrimaryColor,
          elevation: 0),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Palette.Lavendar,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Text("MANAGE NOTIFICATIONS",
                      style: TextStyle(
                          color: Palette.PaleGreen,
                          fontWeight: FontWeight.w500))),
              ItemRow(
                  "Subscribe to daily tips notifications",
                  Switch(
                      value: state_dailyTip,
                      onChanged: (x) {
                        setState(() {
                          state_dailyTip = x;
                        });
                      })),
              Divider(height: 1),
              ItemRow(
                  "Auto-download content updates",
                  Switch(
                      value: state_autoSync,
                      onChanged: (x) {
                        setState(() {
                          state_autoSync = x;
                        });
                      })),
              Divider(height: 1),
              ItemRow(
                  "Preferred language of interaction",
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
