import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/components/form_input.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/globals.dart';

// ignore: must_be_immutable
class SuggestionDialog extends StatefulWidget {
  @override
  _SuggestionDialogState createState() => _SuggestionDialogState();
}

class _SuggestionDialogState extends State<SuggestionDialog> {
  final _formKey = GlobalKey<FormState>();

  bool isSent = false;

  void sendData(bool state) {
    setState(() {
      isSent = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.w500, color: Palette.PaleGreen);

    return Container(
        margin: EdgeInsets.all(15),
        child: isSent
            ? SuggestionResult()
            : SuggestionEntry(
                formKey: _formKey,
                titleStyle: titleStyle,
                action: sendData(true)));
  }
}

class SuggestionEntry extends StatelessWidget {
  const SuggestionEntry(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.titleStyle,
      required this.action})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextStyle titleStyle;
  final void action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(25, 25, 17, 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Make a Suggestion",
                                      style: TextStyle(fontSize: 18)),
                                  Text(
                                      "Your suggestion will be reviewed and may be added on the next data update.",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Palette.PaleGreen)),
                                  SizedBox(height: 20),
                                  Text("Word / Sentence", style: titleStyle),
                                  SizedBox(height: 5),
                                  FormInput("Enter a word in pidgin or english",
                                      requiredValidationMessage:
                                          "Please enter a word"),
                                  SizedBox(height: 15),
                                  Text("Meaning / Translation",
                                      style: titleStyle),
                                  SizedBox(height: 5),
                                  FormInput(
                                      "Meaning or translation of the word",
                                      requiredValidationMessage:
                                          "Please enter meaning",
                                      lines: 3),
                                  SizedBox(height: 15),
                                  Text("Extra Information", style: titleStyle),
                                  SizedBox(height: 5),
                                  FormInput(
                                    "Related words, pronunciation etc..",
                                    lines: 3,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Palette.PrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Button(
                    'Send Suggestion',
                    () {
                      if (_formKey.currentState!.validate()) {
                        action;
                      }
                    },
                    bgColor: Palette.PrimaryLightColor,
                    textColor: Palette.PrimaryColor,
                    width: 170,
                    paddingHorizontal: 0,
                    paddingVertical: 5,
                    textStyle: TextStyle(
                        fontSize: 15, color: Palette.PrimaryDarkColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestionResult extends StatelessWidget {
  const SuggestionResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.fromLTRB(15, 50, 15, 15),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (1 == 2)
                Icon(Icons.remove_circle_rounded, color: Colors.red, size: 60)
              else
                Icon(Icons.check_circle_rounded,
                    color: Palette.PrimaryColor, size: 60),
              SizedBox(height: 15),
              Text("Thank You!", style: TextStyle(fontSize: 18)),
              Text(
                "Your suggestion has been sent for review.",
                style: TextStyle(fontSize: 12, color: Palette.PaleGreen),
              ),
              SizedBox(height: 50),
              ButtonPill("Close", () {
                Navigator.of(context).pop(true);
              }, bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80)
            ],
          ),
        )
      ],
    );
  }
}
