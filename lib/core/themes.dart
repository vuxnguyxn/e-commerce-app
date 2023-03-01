// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/storage_manager.dart';

import 'constants.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      elevation: 0,
      backgroundColor: kContentColorLightTheme,
      toolbarTextStyle: TextStyle(color: kContentColorDarkTheme),
      iconTheme: IconThemeData(color: kContentColorDarkTheme),
      titleTextStyle:
          TextStyle(color: kContentColorDarkTheme, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kContentColorDarkTheme),
      bodyMedium: TextStyle(color: kContentColorDarkTheme),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: kContentColorDarkTheme,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.5),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.white,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kContentColorDarkTheme,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      elevation: 0,
      backgroundColor: kContentColorDarkTheme,
      toolbarTextStyle: TextStyle(color: kContentColorLightTheme),
      iconTheme: IconThemeData(color: kContentColorLightTheme),
      titleTextStyle: TextStyle(
          color: kContentColorLightTheme, fontWeight: FontWeight.bold),
    ),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme:  const TextTheme(
      bodyLarge: TextStyle(color: kContentColorLightTheme),
      bodyMedium: TextStyle(color: kContentColorLightTheme),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kContentColorDarkTheme,
      selectedItemColor: kContentColorLightTheme,
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.5),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.black,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );

  late ThemeData _themeData = darkTheme;
  ThemeData getTheme() => _themeData;
  bool _switchValue = true;
  bool getSwitchValue() => _switchValue;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print("Value read from storage: $value");
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
        _switchValue = false;
      } else {
        _themeData = darkTheme;
        _switchValue = true;
      }
      notifyListeners();
    });
  }
  void setDarkMode() async {
    _themeData = darkTheme;
    _switchValue = true;
    StorageManager.savedData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    _switchValue = false;
    StorageManager.savedData('themeMode', 'light');
    notifyListeners();
  }
}