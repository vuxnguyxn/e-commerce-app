import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../features/home/presentation/home.dart';
import '../features/sign_in/presentation/pages/sign_in_page.dart';

class SignInController extends StatelessWidget {
  const SignInController({super.key});

  static const String route = '/sign_in_controller';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      if (state is SignInSuccess) {
        return const HomeScreen();
      }
      if (state is SignInFailed) {
        return const SignInPage();
      }
      return const SignInPage();
    });
  }
}
