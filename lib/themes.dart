import 'package:flutter/material.dart';
import 'package:ngpidgin/theme_extension.dart';
import 'constants.dart';

class AppThemes {
  static final ThemeData theme = ThemeData();

  // static Map<int, Color> primarySwatch = {
  //   100: Palette.Charcoal,
  //   200: Palette.CharcoalLight
  // };

  static ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    //primarySwatch: MaterialColor(0xFF4B9C7F, primarySwatch),
    // colorScheme: theme.colorScheme.copyWith(primary: Palette.PrimaryLightColor),
    colorScheme: ColorScheme.light(),
    accentColor: Palette.GreenAlt,
    canvasColor: Palette.Lavendar,
    primaryColor: Palette.Green,
    primaryColorDark: Palette.GreenDark,
    primaryColorLight: Palette.GreenLight,
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    appBarTheme: AppBarTheme(color: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Palette.Green,
        selectedIconTheme: IconThemeData(color: Palette.Green),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blueGrey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedIconTheme: IconThemeData(color: Palette.Pale)),
    fontFamily: Fonts.Default,
    textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            bodyText2: TextStyle(fontSize: 16),
            headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            headline2: TextStyle(fontSize: 25),
            headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            headline5: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Palette.Pale),
            headline6: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Palette.Pale),
            subtitle1:
                TextStyle(fontWeight: FontWeight.w500, color: Palette.Pale),
            subtitle2:
                TextStyle(fontWeight: FontWeight.normal, color: Palette.Pale))
        .apply(
            // bodyColor: Colors.black,
            // displayColor: Colors.black,
            ),
  );

  static ThemeData darkTheme = ThemeData(
      backgroundColor: Palette.Charcoal,
      // primarySwatch: Colors.yellow,
      // colorScheme: theme.colorScheme.copyWith(primary: Colors.white),
      colorScheme: ColorScheme.dark(),
      accentColor: Palette.GreenAlt,
      canvasColor: Palette.Charcoal,
      primaryColor: Palette.CharcoalDark,
      primaryColorDark: Palette.Charcoal,
      primaryColorLight: Palette.CharcoalLight,
      cardColor: Palette.CharcoalDark,
      dividerColor: Colors.grey[300],
      appBarTheme: AppBarTheme(color: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Palette.CharcoalDark,
          selectedItemColor: Palette.GreenLight,
          selectedIconTheme: IconThemeData(color: Palette.GreenLight),
          showUnselectedLabels: true,
          unselectedItemColor: Colors.blueGrey[200],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedIconTheme: IconThemeData(color: Colors.blueGrey[200])),
      fontFamily: Fonts.Default,
      textTheme: const TextTheme(
              bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              bodyText2: TextStyle(fontSize: 16, color: Colors.white),
              headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              headline2: TextStyle(fontSize: 25),
              headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              headline5: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              headline6: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.PrimaryLightBrightColor),
              subtitle1: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.Green),
              subtitle2:
                  TextStyle(fontWeight: FontWeight.normal, color: Palette.Pale))
          .apply(
              bodyColor: Colors.white,
              displayColor: Palette.PrimaryLightBrightColor));
}
