import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/horizon_line_with_or.dart';
import '../../widgets/icon_before_and_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: getProportionateScreenWidth(30)),
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
              const HorizonLineWithOr(),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: 'Sign in with password',
                    color: Colors.white,
                    colorText: Colors.black,
                    press: () {}),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding * 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have a account?  "),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
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