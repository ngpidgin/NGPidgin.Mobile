import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngpidgin/components/button.dart';
import 'package:ngpidgin/components/button_pill.dart';
import 'package:ngpidgin/components/form_input.dart';
import 'package:ngpidgin/constants.dart';
import 'package:ngpidgin/extensions/sharedpref_util.dart';
import 'package:ngpidgin/globals.dart';

class SuggestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.canvasColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
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
  final TextStyle titleStyle = TextStyle(color: Palette.Pale);
  final _formKey = GlobalKey<FormState>();
  final wordCtrl = TextEditingController();
  final meaningCtrl = TextEditingController();
  final exampleCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final locationCtrl = TextEditingController();

  var isSent = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference? _collection;

  loadUserInfo() async {
    nameCtrl.text =
        await SharedPreferencesUtil.getString(SettingKeys.appUserName);
    locationCtrl.text =
        await SharedPreferencesUtil.getString(SettingKeys.appUserLocation);
  }

  @override
  void initState() {
    loadUserInfo();

    _collection = _firestore.collection('suggestions');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final platform = Platform.isAndroid ? "Android" : "iOS";

    return !isSent
        ? SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Globals.languageKit.suggestionDesc,
                                style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.colorScheme.onSecondary)),
                            SizedBox(height: 20),
                            FormInput(
                              placeholder: "Enter a word in pidgin or english",
                              label: "Word / Sentence",
                              requiredValidationMessage: "Please enter a word",
                              controller: wordCtrl,
                            ),
                            FormInput(
                              placeholder: "Meaning or translation of the word",
                              label: "Meaning / Translation",
                              requiredValidationMessage: "Please enter meaning",
                              lines: 2,
                              controller: meaningCtrl,
                            ),
                            FormInput(
                              placeholder: "Related words, pronunciation etc..",
                              label: "Extra Information",
                              lines: 2,
                              required: false,
                              controller: exampleCtrl,
                            ),
                            SizedBox(height: 5)
                          ],
                        ),
                      ),
                      Divider(height: 1),
                      Container(
                          padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tell us a little about you!"),
                              FormInput(
                                placeholder: "What's your name?",
                                requiredValidationMessage:
                                    "Please enter your name",
                                controller: nameCtrl,
                              ),
                              FormInput(
                                placeholder: "Your location (optional)",
                                required: false,
                                controller: locationCtrl,
                              ),
                              Center(
                                child: Button('Share', () async {
                                  if (_formKey.currentState!.validate()) {
                                    // save user info for next suggestion
                                    SharedPreferencesUtil.setString(
                                        SettingKeys.appUserName, nameCtrl.text);
                                    SharedPreferencesUtil.setString(
                                        SettingKeys.appUserLocation,
                                        locationCtrl.text);

                                    // save
                                    DocumentReference documentReferencer =
                                        _collection!.doc();

                                    Map<String, dynamic> data =
                                        <String, dynamic>{
                                      "word": wordCtrl.text,
                                      "meaning": meaningCtrl.text,
                                      "example": exampleCtrl.text,
                                      "user_name": nameCtrl.text,
                                      "user_location": locationCtrl.text,
                                      "platform": platform,
                                      "datetime": DateTime.now().toString(),
                                    };

                                    await documentReferencer
                                        .set(data)
                                        .catchError((e) => print(e));

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
                    ]),
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
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: theme.canvasColor),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_rounded,
                  color: Palette.PrimaryColor, size: 60),
              SizedBox(height: 15),
              Text("Thank You!",
                  style: theme.textTheme.headline1!
                      .copyWith(color: theme.colorScheme.onSecondary)),
              Text(
                "Your suggestion has been sent for review.",
                style: theme.textTheme.bodyText1!
                    .copyWith(color: theme.colorScheme.onSecondary),
              ),
              SizedBox(height: 60),
              ButtonPill("Okay", () {
                Navigator.of(context).pop(true);
              }, bgColor: Palette.Lavendar, textColor: Colors.grey, width: 80)
            ],
          ),
        )
      ],
    );
  }
}
