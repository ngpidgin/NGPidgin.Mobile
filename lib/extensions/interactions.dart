import 'package:flutter/material.dart';

class Interactions {
  static SnackBar Snacky(String text,
      {String buttonText = "Okay",
      Function? onPressed,
      Color? bgColor,
      Color? buttonColor,
      int durationInSeconds = 3}) {
    return SnackBar(
        content: Text(text),
        backgroundColor: bgColor,
        duration: Duration(seconds: durationInSeconds),
        action: SnackBarAction(
          label: buttonText,
          textColor: buttonColor,
          onPressed: () => onPressed,
        ));
  }
}
