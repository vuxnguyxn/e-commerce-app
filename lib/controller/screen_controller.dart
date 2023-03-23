import 'package:e_commerce_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/sign_in/sign_in.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  static const String route = '/screen_controller';

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AppLoader());
  }
  @override
  void dispose() {
    super.dispose();
    context.read<AuthBloc>().add(AppLoader());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeScreen();
        }
        if (state is UnAuthenticated) {
          return const SignIn();
        }
        return const SignIn();
      },
    );
  }
}
