import 'package:e_commerce_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  static const String route = '/screen_controller';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        } else {
          return const SignIn();
        }
      },
    );
  }
}
