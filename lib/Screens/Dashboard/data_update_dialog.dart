import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';

enum updateProgress { downloading, updating, completed }

// ignore: must_be_immutable
class DataUpdateDialog extends StatefulWidget {
  @override
  _DataUpdateDialogState createState() => _DataUpdateDialogState();
}

class _DataUpdateDialogState extends State<DataUpdateDialog> {
  updateProgress progress = updateProgress.downloading;
  String progressTitle = "Downloading data updates..";

  @override
  void initState() {
    super.initState();

    download().then((value) {
      if (value) {
        setState(() {
          progress = updateProgress.updating;
          progressTitle = "Updating database..";
        });

        update().then((value) {
          if (value) {
            setState(() {
              progress = updateProgress.completed;
              progressTitle = "Update completed!";
            });

            SharedPreferencesUtil.setInt(SettingKeys.databaseUpdateVersion,
                Globals.dataUpdate!.updateVersion);
          }
        });
      }
    });
  }

  Future<bool> download() async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 150, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (progress == updateProgress.downloading ||
                progress == updateProgress.updating)
              CircularProgressIndicator(color: Palette.PrimaryColor)
            else
              Icon(Icons.check_circle_rounded,
                  color: Palette.PrimaryColor, size: 60),
            SizedBox(height: 15),
            Text(progressTitle, style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UpdateItem("Words", Globals.dataUpdate!.words),
                      UpdateItem("Sentences", Globals.dataUpdate!.sentences),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UpdateItem("Stickers", Globals.dataUpdate!.stickers),
                      ])
                ])),
            SizedBox(height: 50),
            if (progress == updateProgress.completed)
              ButtonPill("Close", () {
                Navigator.of(context).pop(true);
              }, bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80)
            else
              Text("Please wait for update to complete",
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic))
          ],
        ));
  }
}

class UpdateItem extends StatelessWidget {
  final String title;
  final int count;
  const UpdateItem(this.title, this.count);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Palette.PaleGreen)),
        Text(count.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ],
    );
  }
}
