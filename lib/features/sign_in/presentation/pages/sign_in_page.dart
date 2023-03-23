import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/sign_in/presentation/pages/forgot_password_page.dart';
import 'package:e_commerce_app/features/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:e_commerce_app/widgets/horizon_line_with_or.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/question_and_text_ink_well.dart';
import '../../../sign_up/presentation/pages/sign_up_page.dart';
import '../../../sign_up/presentation/widgets/icon_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String route = '/sign_in_page';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(kDefaultPadding * 2),
                ),
                child: Text(
                  'Login to your\n Account',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SignInForm(
                isDarkMode: isDarkMode,
              ),
              Center(
                  child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPasswordPage.route),
                child: const Text(
                  'Forgot the password?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding * 1.5),
              ),
              const HorizonLineWithOr(middleText: 'or continue with'),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconSignIn(
                    press: () {},
                    icon: Icons.facebook_outlined,
                  ),
                  IconSignIn(
                    press: () {},
                    icon: Icons.g_mobiledata_outlined,
                  ),
                  IconSignIn(
                    press: () {},
                    icon: Icons.apple_outlined,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding * 2),
              ),
              QuestionAndTextInkWell(
                title: 'Sign Up',
                press: () =>
                    Navigator.pushReplacementNamed(context, SignUpPage.route),
                question: "Don't have an account?",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
