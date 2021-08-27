import 'package:flutter/material.dart';
import 'constants.dart';

class AppThemes {
// ----------------------------------
// DARK THEME
// ----------------------------------

  static final ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Palette.Green,
      primaryVariant: Palette.GreenAlt,
      secondary: Colors.white,
      secondaryVariant: Color(0xFFF8F8F8),
      error: Color(0xffb00020),
      background: Colors.white,
      onError: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xff292929),
      onPrimary: Colors.white,
      onSurface: Color(0xff292929),
      surface: Colors.white);

  static ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      colorScheme: lightColorScheme,
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
      buttonTheme: ButtonThemeData(
          splashColor: Colors.red,
          buttonColor: Colors.red,
          textTheme: ButtonTextTheme.accent),
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
          bodyText1: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
          bodyText2: TextStyle(fontSize: 16),
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          headline2: TextStyle(fontSize: 25),
          headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          headline5: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Palette.Pale),
          headline6: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Palette.Pale),
          subtitle1:
              TextStyle(fontWeight: FontWeight.w500, color: Palette.Pale),
          subtitle2: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Palette.Pale)));

// ----------------------------------
// DARK THEME
// ----------------------------------

  static final ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Palette.GreenAlt,
      primaryVariant: Palette.GreenLight,
      secondary: Palette.CharcoalDark,
      secondaryVariant: Palette.PaleDark.withOpacity(0.9),
      error: Color(0xffb00020),
      background: Colors.white,
      onError: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xff292929),
      onPrimary: Colors.white,
      onSurface: Color(0xff292929),
      surface: Colors.white);

  static ThemeData darkTheme = ThemeData(
      backgroundColor: Palette.Charcoal,
      colorScheme: darkColorScheme,
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
          bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 16, color: Colors.white),
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          headline2: TextStyle(fontSize: 25),
          headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          headline5: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Palette.GreenLight),
          headline6: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
          subtitle1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.Charcoal),
          subtitle2: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.GreenLightBright)));
  // .apply(
  //     bodyColor: Colors.white,
  //     displayColor: Palette.PrimaryLightBrightColor));
}
