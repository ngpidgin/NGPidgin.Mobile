import 'package:flutter/material.dart';

class Interactions {
  static SnackBar snacky(String text,
      {String buttonText = "Okay",
      Function? onPressed,
      int durationInSeconds = 3}) {
    return SnackBar(
        content: Text(text),
        duration: Duration(seconds: durationInSeconds),
        action: SnackBarAction(
          label: buttonText,
          onPressed: () => onPressed,
        ));
  }
}
