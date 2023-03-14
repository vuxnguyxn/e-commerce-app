import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/horizon_line_with_or.dart';
import 'package:flutter/material.dart';

import '../../widgets/question_and_text_ink_well.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/icon_sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  static const String route = '/sign_up';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
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
                'Create your\n Account',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(35),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SignUpForm(
              isDarkMode: isDarkMode,
            ),
            const HorizonLineWithOr(middleText: 'or continue with'),
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
            QuestionAndTextInkWell(
              title: 'Sign In',
              press: () => Navigator.pop(context),
              question: "Already have an account?",
            ),
          ],
        ),
      ),
    );
  }
}
