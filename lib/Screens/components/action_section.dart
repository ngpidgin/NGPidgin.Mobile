import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ngpidgin/components/button_icon.dart';
import 'package:ngpidgin/constants.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ngpidgin/extensions/db_helper.dart';
import 'package:ngpidgin/globals.dart';
import 'package:ngpidgin/models/dictionary_models.dart';
import 'package:share/share.dart';

enum TtsState { playing, stopped, paused, continued }

// ignore: must_be_immutable
class ActionSection extends StatefulWidget {
  final int index;
  final favoriteType type;
  final String contentKey;
  final String audioReaderContent;
  final String shareContent;
  bool isFav;
  bool showNav;
  final Function(bool next)? changeIndex;
  ActionSection(this.index, this.type, this.contentKey, this.audioReaderContent,
      this.shareContent, this.isFav,
      {this.changeIndex, this.showNav = true});

  @override
  _ActionSectionState createState() => _ActionSectionState();
}

class _ActionSectionState extends State<ActionSection> {
  TtsState ttsState = TtsState.stopped;
  FlutterTts flutterTts = FlutterTts();

  void toggleFavorite() async {
    final db = await DatabaseHelper.loadDatabase();

    // get item from global
    // update isFavorite
    // update on database

    if (widget.isFav) {
      // remove
      if (widget.type == favoriteType.word) {
        WordModel item;
        if (widget.index == -1) {
          // source = fav. No index is supplied
          // pick using contentKey
          item = Globals.wordDataset
              .firstWhere((a) => a.word == widget.contentKey);
        } else {
          // pick using index
          item = Globals.wordDataset[widget.index];
        }

        item.isFavorite = 0;
        db.update(DictionarySchema.Words, item.toMap(),
            where: "Word = '${widget.contentKey}'");

        if (widget.index == -1)
          Globals.wordDataset
              .firstWhere((a) => a.word == widget.contentKey)
              .isFavorite = 0;
        else
          Globals.wordDataset[widget.index].isFavorite = 0;
      } else {
        SentenceModel item;
        if (widget.index == -1) {
          // source = fav. No index is supplied
          // pick using contentKey
          item = Globals.sentenceDataset
              .firstWhere((a) => a.sentence == widget.contentKey);
        } else {
          // pick using index
          item = Globals.sentenceDataset[widget.index];
        }

        item.isFavorite = 0;
        db.update(DictionarySchema.Sentences, item.toMap(),
            where: "Sentence = '${widget.contentKey}'");

        if (widget.index == -1)
          Globals.sentenceDataset
              .firstWhere((a) => a.sentence == widget.contentKey)
              .isFavorite = 0;
        else
          Globals.sentenceDataset[widget.index].isFavorite = 0;
      }
    } else {
      // add
      if (widget.type == favoriteType.word) {
        WordModel item;
        if (widget.index == -1) {
          // source = fav. No index is supplied
          // pick using contentKey
          item = Globals.wordDataset
              .firstWhere((a) => a.word == widget.contentKey);
        } else {
          // pick using index
          item = Globals.wordDataset[widget.index];
        }

        item.isFavorite = 1;
        db.update(DictionarySchema.Words, item.toMap(),
            where: "Word = '${widget.contentKey}'");

        if (widget.index == -1)
          Globals.wordDataset
              .firstWhere((a) => a.word == widget.contentKey)
              .isFavorite = 1;
        else
          Globals.wordDataset[widget.index].isFavorite = 1;
      } else {
        SentenceModel item;
        if (widget.index == -1) {
          // source = fav. No index is supplied
          // pick using contentKey
          item = Globals.sentenceDataset
              .firstWhere((a) => a.sentence == widget.contentKey);
        } else {
          // pick using index
          item = Globals.sentenceDataset[widget.index];
        }

        item = Globals.sentenceDataset[widget.index];
        item.isFavorite = 1;
        db.update(DictionarySchema.Sentences, item.toMap(),
            where: "Sentence = '${widget.contentKey}'");

        if (widget.index == -1)
          Globals.sentenceDataset
              .firstWhere((a) => a.sentence == widget.contentKey)
              .isFavorite = 1;
        else
          Globals.sentenceDataset[widget.index].isFavorite = 1;
      }
    }

    setState(() {
      widget.isFav = !widget.isFav;
    });

    showDialog(
      context: context,
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
                  widget.isFav
                      ? Globals.languageKit.favoriteAdded
                      : Globals.languageKit.favoriteRemoved,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )));
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
              Icon(widget.isFav ? Icons.favorite : Icons.favorite_outline,
                  color: widget.isFav
                      ? Color(0xFFFA7C7C)
                      : Palette.PrimaryLightBrightColor),
              () => toggleFavorite()),
          SizedBox(width: 20),
          widget.showNav
              ? ButtonIcon(
                  Icon(Icons.chevron_left, color: Palette.PrimaryColor), () {
                  widget.changeIndex!(false);
                }, bgColor: Palette.PrimaryLightBrightColor)
              : Container(),
          widget.showNav
              ? ButtonIcon(
                  Icon(Icons.chevron_right, color: Palette.PrimaryColor), () {
                  widget.changeIndex!(true);
                }, bgColor: Palette.PrimaryLightBrightColor)
              : Container()
        ]));
  }
}
