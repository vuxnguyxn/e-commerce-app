import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../pages/fill_your_profile_page.dart';
import 'check_remember_me.dart';
import '../../../../widgets/form_error.dart';

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
  String? email, password;
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
              },
              //check validator
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                  addError(error: kEmailNullError);
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError)) {
                  addError(error: kInvalidEmailError);
                }
                return null;
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
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
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
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kPassNullError)) {
                  addError(error: kPassNullError);
                } else if (value.length < 6 &&
                    !errors.contains(kShortPassError)) {
                  addError(error: kShortPassError);
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                icon: Icon(Icons.lock),
                hintText: 'Password',
              ),
            ),
          ),
          FormError(errors: errors),
          const CheckRememberMe(),
          Container(
            margin: EdgeInsets.only(
                bottom: getProportionateScreenWidth(kDefaultPadding * 2),
                top: getProportionateScreenWidth(kDefaultPadding)),
            width: double.infinity,
            child: CustomButton(
                title: 'Sign Up',
                color: widget.isDarkMode ? Colors.white : Colors.black,
                colorText: widget.isDarkMode ? Colors.black : Colors.white,
                press: () {
                  // if (formKey.currentState!.validate()) {
                  //   //Handle sign up account
                  // }
                  Navigator.pushNamed(
                      context, FillYourProfilePage.route);
                }),
          ),
        ],
      ),
    );
  }
}
