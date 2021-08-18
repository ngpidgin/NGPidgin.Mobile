import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/components/form_input.dart';
import 'package:ngpidgin/constants.dart';

// ignore: must_be_immutable
class SuggestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.PrimaryColor,
        title: const Text("Make a Suggestion"),
      ),
      body: const SuggestionForm(),
    );
  }
}

class SuggestionForm extends StatefulWidget {
  const SuggestionForm({Key? key}) : super(key: key);
  @override
  _SuggestionFormState createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  final TextStyle titleStyle = TextStyle(color: Palette.PaleGreen);
  final _formKey = GlobalKey<FormState>();

  var isSent = false;

  @override
  Widget build(BuildContext context) {
    return !isSent
        ? SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Your suggestion will be reviewed and may be added on the next data update.",
                                  style: TextStyle(
                                      fontSize: 12, color: Palette.PaleGreen)),
                              SizedBox(height: 20),
                              FormInput(
                                  placeholder:
                                      "Enter a word in pidgin or english",
                                  label: "Word / Sentence",
                                  requiredValidationMessage:
                                      "Please enter a word"),
                              FormInput(
                                  placeholder:
                                      "Meaning or translation of the word",
                                  label: "Meaning / Translation",
                                  requiredValidationMessage:
                                      "Please enter meaning",
                                  lines: 2),
                              FormInput(
                                  placeholder:
                                      "Related words, pronunciation etc..",
                                  label: "Extra Information",
                                  lines: 2,
                                  required: false),
                              SizedBox(height: 5)
                            ],
                          ),
                        ),
                        Divider(height: 1),
                        Container(
                            padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                            decoration: BoxDecoration(color: Palette.Lavendar),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tell us a little about you!"),
                                FormInput(
                                    placeholder: "What's your name?",
                                    requiredValidationMessage:
                                        "Please enter your name"),
                                FormInput(
                                    placeholder: "Your location (optional)",
                                    required: false),
                                Center(
                                  child: Button('Send Suggestion', () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isSent = true;
                                      });
                                    }
                                  },
                                      width: double.infinity,
                                      paddingHorizontal: 0,
                                      paddingVertical: 10,
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Palette.PrimaryLightBrightColor)),
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : SuggestionResult();
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
              Icon(Icons.check_circle_rounded,
                  color: Palette.PrimaryColor, size: 60),
              SizedBox(height: 15),
              Text("Thank You!", style: TextStyle(fontSize: 18)),
              Text(
                "Your suggestion has been sent for review.",
                style: TextStyle(fontSize: 12, color: Palette.PaleGreen),
              ),
              SizedBox(height: 60),
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
