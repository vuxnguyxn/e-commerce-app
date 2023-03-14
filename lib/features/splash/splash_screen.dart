import 'dart:async';

import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/signin/sign_in.dart';
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
    // countDownTime();
  }

  void _navigator() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, SignIn.route));
  }

  // int val = 3;
  // void countDownTime() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     val > 0
  //         ? setState(
  //             () => val--,
  //           )
  //         : timer.cancel();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
