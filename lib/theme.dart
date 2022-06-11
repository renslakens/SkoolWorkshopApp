import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';

ThemeData customLightTheme() {
  TextTheme _LightThemeTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontFamily: 'Oswald',
        fontSize: 28.0,
        color: OswaldColor,
      ),
      headline2: base.headline2?.copyWith(
        fontFamily: 'Heebo',
        fontSize: 24.0,
        color: OswaldColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: base.bodyText1?.copyWith(
        fontFamily: 'Heebo',
        fontSize: 17.0,
        color: HeeboColor,
      ),
      bodyText2: base.bodyText1?.copyWith(
        color: Colors.white,
      ),
    );
  }
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    textTheme: _LightThemeTextTheme(lightTheme.textTheme),
    appBarTheme: const AppBarTheme(
      color: mainColor,
    ),
    primaryColor: mainColor,
    scaffoldBackgroundColor: backgroundColor,
  );
}
