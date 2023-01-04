import 'package:e_commerce_app/routes.dart';
import 'package:e_commerce_app/screens/splash/splash_screen.dart';
import 'package:e_commerce_app/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context), 
      routes: routes,
      initialRoute: SplashScreen.route,
    );
  }
}
