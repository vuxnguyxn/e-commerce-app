import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/sign_in/presentation/sign_in_page.dart';
import 'package:e_commerce_app/features/sign_up/presentation/sign_up_page.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/horizon_line_with_or.dart';
import '../../widgets/icon_before_and_button.dart';
import '../../widgets/question_and_text_ink_well.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * .4,
                height: SizeConfig.screenWidth * .4,
                child: CircleAvatar(
                  child: Image.asset('assets/images/profile_image.png'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              Text(
                "Let's your in",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              const IconBeforeAndButton(
                icon: Icons.facebook_outlined,
                text: 'Continue with Facebook',
              ),
              const IconBeforeAndButton(
                icon: Icons.g_mobiledata_outlined,
                text: 'Continue with Google',
              ),
              const IconBeforeAndButton(
                icon: Icons.apple_outlined,
                text: 'Continue with Apple',
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              const HorizonLineWithOr(
                middleText: 'or',
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: 'Sign in with password',
                    color: isDarkMode ? Colors.white : Colors.black,
                    colorText: isDarkMode ? Colors.black : Colors.white,
                    press: () =>
                        Navigator.pushNamed(context, SignInPage.route)),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding * 2),
              ),
              QuestionAndTextInkWell(
                title: 'Sign Up',
                press: () => Navigator.pushReplacementNamed(context, SignUpPage.route),
                question: "Don't have an account?",
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
