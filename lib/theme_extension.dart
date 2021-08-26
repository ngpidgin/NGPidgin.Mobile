import 'package:flutter/material.dart';
import 'package:ngpidgin/constants.dart';

extension LightThemeEx on ThemeData {
  Color get dialogColor1 {
    return this.brightness == Brightness.light
        ? Colors.white
        : Palette.CharcoalDark;
  }

  Color get dialogColor2 {
    return this.brightness == Brightness.light
        ? Color(0xFFF8F8F8)
        : Palette.PaleDark.withOpacity(0.9);
  }

  Color get titleColor1 {
    return this.brightness == Brightness.light
        ? Palette.Pale
        : Palette.PrimaryLightBrightColor;
  }
}

// class OwnThemeFields {
//   final Color errorTextColor;
//   final Color cardTitleColor;
//   final Color titleColor;
//   final Color dialogColor;

//   const OwnThemeFields(
//       {Color errorTextColor = Colors.red,
//       Color cardTitleColor = Colors.white,
//       Color titleColor = Colors.black,
//       Color dialogColor = Colors.white})
//       : this.errorTextColor = errorTextColor,
//         this.cardTitleColor = cardTitleColor,
//         this.titleColor = titleColor,
//         this.dialogColor = dialogColor;
// }

// extension ThemeDataExtensions on ThemeData {
//   static Map<InputDecorationTheme, OwnThemeFields> _own = {};

//   void addOwn(OwnThemeFields own) {
//     _own[this.inputDecorationTheme] = own;
//   }

//   OwnThemeFields own() {
//     return _own[this.inputDecorationTheme]!;
//   }
// }

// OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();
