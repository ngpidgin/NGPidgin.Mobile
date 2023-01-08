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
