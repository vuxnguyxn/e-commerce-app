import 'package:e_commerce_app/blocs/app_bloc/app_bloc.dart';
import 'package:e_commerce_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/notification_error.dart';
import '../../../sign_up/presentation/widgets/check_remember_me.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  State<SignInForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  String email = "", password = "";
  bool visible = true;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
            margin: EdgeInsets.only(
                bottom: getProportionateScreenWidth(kDefaultPadding)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey.withOpacity(.2),
            ),
            child: TextFormField(
              onSaved: (newValue) => email = newValue!,
              //reCheck when chang text
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                  removeError(error: kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  removeError(error: kInvalidEmailError);
                }
                email = value;
              },
              //check validator
              // validator: (value) {
              //   if (value!.isEmpty && !errors.contains(kEmailNullError)) {
              //     addError(error: kEmailNullError);
              //   } else if (!emailValidatorRegExp.hasMatch(value) &&
              //       !errors.contains(kInvalidEmailError)) {
              //     addError(error: kInvalidEmailError);
              //   }
              //   return null;
              // },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                icon: Icon(Icons.email),
                hintText: 'Email',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(kDefaultPadding)),
            margin: EdgeInsets.only(
                bottom: getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey.withOpacity(.2),
            ),
            child: TextFormField(
              onSaved: (newValue) => password = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kPassNullError)) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 6 &&
                    errors.contains(kShortPassError)) {
                  removeError(error: kShortPassError);
                }
                password = value;
              },
              // validator: (value) {
              //   if (value!.isEmpty && !errors.contains(kPassNullError)) {
              //     addError(error: kPassNullError);
              //   } else if (value.length < 6 &&
              //       !errors.contains(kShortPassError)) {
              //     addError(error: kShortPassError);
              //   }
              //   return null;
              // },
              textInputAction: TextInputAction.done,
              obscureText: visible,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                icon: const Icon(Icons.lock),
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  icon: Icon(visible
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye),
                ),
              ),
            ),
          ),
          // FormError(errors: errors),
          NotificationError(
            text: authErrorSignIn,
          ),
          const CheckRememberMe(),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: getProportionateScreenWidth(kDefaultPadding * 2),
                    top: getProportionateScreenWidth(kDefaultPadding)),
                width: double.infinity,
                child: CustomButton(
                  title: 'Sign In',
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                  colorText: widget.isDarkMode ? Colors.black : Colors.white,
                  isLoading: state.isLoading,
                  press: () {
                    context
                        .read<SignInBloc>()
                        .add(SignInLoaded(email: email, password: password));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
