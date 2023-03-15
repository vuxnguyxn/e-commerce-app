import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/form_error.dart';
import '../../../sign_up/presentation/widgets/check_remember_me.dart';

class CreateNewPasswordForm extends StatefulWidget {
  const CreateNewPasswordForm({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  State<CreateNewPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<CreateNewPasswordForm> {
  final formKey = GlobalKey<FormState>();
  String? password, rePassword;
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

  void showDialogSuccess({required bool isDarkMode}) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenWidth(kDefaultPadding * 3),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? kContentColorLightTheme : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  size: 36,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: getProportionateScreenWidth(22)),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'Your account is ready to use. You will be redirected to the Home page in a \n few seconds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
              onSaved: (newValue) => rePassword = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kRePassNullError)) {
                  removeError(error: kRePassNullError);
                } else if (value.length >= 6 &&
                    errors.contains(kShortRePassError)) {
                  removeError(error: kShortRePassError);
                }
                rePassword = value;
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kRePassNullError)) {
                  addError(error: kRePassNullError);
                } else if (value.length < 6 &&
                    !errors.contains(kShortRePassError)) {
                  addError(error: kShortRePassError);
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                icon: Icon(Icons.lock),
                hintText: 'Re-Enter Password',
              ),
            ),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenWidth(kDefaultPadding),
          ),
          const CheckRememberMe(),
          SizedBox(
            height: getProportionateScreenWidth(kDefaultPadding),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                title: "Continue",
                color: widget.isDarkMode ? Colors.white : Colors.black,
                colorText: widget.isDarkMode ? Colors.black : Colors.white,
                press: () {
                  // if (formKey.currentState!.validate()) {
                    
                  // }
                  showDialogSuccess(isDarkMode: widget.isDarkMode);
                }),
          )
        ],
      ),
    );
  }
}
