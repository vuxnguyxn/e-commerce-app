import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: kContentColorDarkTheme,
    brightness: Brightness.light,
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
      bodyLarge: TextStyle(color: kContentColorLightTheme, fontSize: 16),
      bodyMedium: TextStyle(color: kContentColorLightTheme, fontSize: 16),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kContentColorDarkTheme,
      selectedItemColor: kContentColorLightTheme,
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.5),
    ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // By default flutter provide us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
     brightness: Brightness.dark,
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
      bodyLarge: TextStyle(color: kContentColorDarkTheme, fontSize: 16),
      bodyMedium: TextStyle(color: kContentColorDarkTheme, fontSize: 16),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: kContentColorDarkTheme,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.5),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}
