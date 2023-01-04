import 'package:e_commerce_app/screens/homes/home_screen.dart';
import 'package:e_commerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.route: (context) => const SplashScreen(),
   HomeScreen.route: (context) => const HomeScreen(),
};
