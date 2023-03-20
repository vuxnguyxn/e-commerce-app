import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/sign_in/sign_in.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  static const String route = '/screen_controller';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthRepository().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const SignIn();
        }
      },
    );
  }
}
