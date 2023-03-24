import 'package:e_commerce_app/blocs/update_profile_bloc/update_profile_bloc.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/sign_up/presentation/pages/fill_your_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileController extends StatelessWidget {
  const UpdateProfileController({super.key});

  static const String route = '/update_profile_controller';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
      builder: (context, state) {
        if (state is UpdateProfileSuccess) {
          return const HomeScreen();
        }
        if (state is UpdateProfileFailed) {
          return const FillYourProfilePage();
        }
        return const FillYourProfilePage();
      },
    );
  }
}
