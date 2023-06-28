import 'package:e_commerce_app/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:e_commerce_app/widgets/notification_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../pages/sign_up_page.dart';
import 'check_remember_me.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  State<SignUpForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  String email = '', password = '';
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
          NotificationError(text: authErrorSignUp),
          const CheckRememberMe(),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(
                    bottom: getProportionateScreenWidth(kDefaultPadding * 2),
                    top: getProportionateScreenWidth(kDefaultPadding)),
                width: double.infinity,
                child: CustomButton(
                  title: 'Sign Up',
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                  colorText: widget.isDarkMode ? Colors.black : Colors.white,
                  isLoading: state.isLoading,
                  press: () {
                    context.read<SignUpBloc>().add(
                          SignUpLoaded(email: email, password: password),
                        );
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
