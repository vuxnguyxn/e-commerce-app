import 'dart:async';

import 'package:e_commerce_app/controller/screen_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/Splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigator();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _navigator();
  // }

  void _navigator() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ScreenController.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
