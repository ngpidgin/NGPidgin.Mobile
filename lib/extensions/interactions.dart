import 'dart:io';

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

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      // print('No internet connection');
    }

    return false;
  }
}
