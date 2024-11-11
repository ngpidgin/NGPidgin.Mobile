import 'package:flutter/material.dart';
import 'constants.dart';

class AppThemes {
// ----------------------------------
// LIGHT THEME
// ----------------------------------

  static final ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Palette.Green,
      secondary: Colors.white,
      error: Color(0xffb00020),
      onError: Colors.white,
      onSecondary: Palette.PaleDark,
      onPrimary: Colors.white,
      onSurface: Color(0xff292929),
      surface: Colors.white);

  static ThemeData lightTheme = ThemeData(
      canvasColor: Palette.Lavendar,
      primaryColor: Palette.Green,
      primaryColorDark: Palette.GreenDark,
      primaryColorLight: Palette.GreenLight,
      cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Palette.Green,
          actionTextColor: Palette.GreenLightBright,
          contentTextStyle: TextStyle(color: Colors.white)),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
      dividerColor: Colors.grey[300],
      appBarTheme: AppBarTheme(color: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Palette.Green,
          selectedIconTheme: IconThemeData(color: Palette.Green),
          showUnselectedLabels: true,
          unselectedItemColor: Palette.Pale,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedIconTheme: IconThemeData(color: Palette.Pale)),
      fontFamily: Fonts.Default,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          displayMedium: TextStyle(fontSize: 25),
          displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          headlineSmall: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Palette.Pale),
          titleLarge: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Palette.Pale),
          titleMedium:
              TextStyle(fontWeight: FontWeight.w500, color: Palette.Pale),
          titleSmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Palette.Pale)),
      colorScheme: lightColorScheme.copyWith(surface: Colors.white));

// ----------------------------------
// DARK THEME
// ----------------------------------

  static final ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Palette.GreenAlt,
      secondary: Palette.CharcoalDark,
      error: Color(0xffb00020),
      onError: Colors.white,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
      onSurface: Color(0xff292929),
      surface: Colors.white);

  static ThemeData darkTheme = ThemeData(
      canvasColor: Palette.Charcoal,
      primaryColor: Palette.CharcoalDark,
      primaryColorDark: Palette.Charcoal,
      primaryColorLight: Palette.CharcoalLight,
      cardTheme: CardTheme(
          color: Palette.CharcoalDark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.white,
          actionTextColor: Palette.Green,
          contentTextStyle: TextStyle(color: Palette.Charcoal)),
      dividerColor: Colors.grey[300],
      appBarTheme: AppBarTheme(color: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Palette.CharcoalDark,
          selectedItemColor: Palette.GreenLight,
          selectedIconTheme: IconThemeData(color: Palette.GreenLight),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.blueGrey[200],
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedIconTheme: IconThemeData(color: Colors.blueGrey[200])),
      fontFamily: Fonts.Default,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          displayLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          displayMedium: TextStyle(fontSize: 25),
          displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          headlineSmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Palette.GreenLight),
          titleLarge: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
          titleMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.Charcoal),
          titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.GreenLightBright)),
      colorScheme: darkColorScheme.copyWith(surface: Palette.Charcoal));
  // .apply(
  //     bodyColor: Colors.white,
  //     displayColor: Palette.PrimaryLightBrightColor));
}
