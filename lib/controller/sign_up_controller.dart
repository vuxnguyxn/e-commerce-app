import 'package:e_commerce_app/features/sign_up/presentation/pages/fill_your_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../features/sign_up/presentation/pages/sign_up_page.dart';

class SignUpController extends StatelessWidget {
  const SignUpController({super.key});

  static const String route = '/sign_up_controller';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpSuccess) {
          return const FillYourProfilePage();
        }
        if (state is SignUpFailed) {
          return const SignUpPage();
        }
        return const SignUpPage();
      },
    );
  }
}
