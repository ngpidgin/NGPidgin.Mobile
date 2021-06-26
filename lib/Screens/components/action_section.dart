import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ngpidgin/components/button_icon.dart';
import 'package:ngpidgin/constants.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ngpidgin/globals.dart';
import 'package:share/share.dart';

enum TtsState { playing, stopped, paused, continued }

class ActionSection extends StatefulWidget {
  final String audioReaderContent;
  final String shareContent;
  final bool isFav;
  final Function toggleFavorite;
  ActionSection(this.audioReaderContent, this.shareContent, this.isFav,
      this.toggleFavorite);

  @override
  _ActionSectionState createState() => _ActionSectionState();
}

class _ActionSectionState extends State<ActionSection> {
  bool isFav = false;
  TtsState ttsState = TtsState.stopped;
  FlutterTts flutterTts = FlutterTts();

  void toggleFavorite() {
    if (widget.isFav) {
      // remove
    } else {
      // add
    }

    setState(() {
      isFav = !isFav;
    });

    showDialog(
      context: context, //myGlobals.scaffoldKey.currentContext ?? context,
      builder: (BuildContext dialogContext) {
        Timer(Duration(seconds: 2), () {
          Navigator.of(dialogContext).pop();
        });

        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: AlertDialog(
                backgroundColor: Color(0x80000000),
                elevation: 0,
                content: Text(
                    "Word don " +
                        (!isFav ? "comot from" : "join") +
                        " your favorite words",
                    style: TextStyle(color: Colors.white, fontSize: 12))));

        // return AlertDialog(
        //   backgroundColor: Colors.black,
        //   content: Text(
        //       "Word don " +
        //           (!isFav ? "comot from" : "join") +
        //           " your favorite words",
        //       style: TextStyle(color: Colors.white, fontSize: 12)),
        // );
      },
    );
  }

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future _speak() async {
      // await flutterTts.setVolume(volume);
      // await flutterTts.setSpeechRate(rate);
      // await flutterTts.setPitch(pitch);

      await flutterTts.setLanguage("en-NG");

      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(widget.audioReaderContent);
    }

    Future _stop() async {
      await flutterTts.stop();
    }

    return Container(
        padding: EdgeInsets.all(15),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ButtonIcon(
              Icon(Icons.volume_up,
                  color: ttsState == TtsState.stopped
                      ? Palette.PrimaryLightBrightColor
                      : Colors.lime), () {
            if (ttsState == TtsState.stopped)
              _speak();
            else
              _stop();
          }),
          ButtonIcon(
              Icon(Icons.share_outlined,
                  color: Palette.PrimaryLightBrightColor), () {
            Share.share(widget.shareContent);
          }),
          ButtonIcon(
              Icon(isFav ? Icons.favorite : Icons.favorite_outline,
                  color: isFav
                      ? Color(0xFFFA7C7C)
                      : Palette.PrimaryLightBrightColor),
              () => toggleFavorite()),
          SizedBox(width: 20),
          ButtonIcon(
              Icon(Icons.chevron_left, color: Palette.PrimaryColor), () {},
              bgColor: Palette.PrimaryLightBrightColor),
          ButtonIcon(
              Icon(Icons.chevron_right, color: Palette.PrimaryColor), () {},
              bgColor: Palette.PrimaryLightBrightColor)
        ]));
  }
}
