import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: kContentColorDarkTheme,
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      elevation: 0,
      backgroundColor: kContentColorDarkTheme,
      toolbarTextStyle: TextStyle(color: kContentColorLightTheme),
      iconTheme: IconThemeData(color: kContentColorLightTheme),
      titleTextStyle: TextStyle(color: kContentColorLightTheme, fontSize: 20,  fontWeight: FontWeight.bold),
    ),
    primaryColor: kPrimaryColor,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kContentColorLightTheme),
      bodyText2: TextStyle(color: kContentColorLightTheme),
    ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kContentColorLightTheme,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      elevation: 0,
      backgroundColor: kContentColorLightTheme,
      toolbarTextStyle: TextStyle(color: kContentColorDarkTheme),
      iconTheme: IconThemeData(color: kContentColorDarkTheme),
      titleTextStyle: TextStyle(color: kContentColorDarkTheme, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kContentColorDarkTheme),
      bodyText2: TextStyle(color: kContentColorDarkTheme),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kContentColorLightTheme,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}
