import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import 'pin_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String route = '/forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isSelectedSmS = true;
  bool isSelectedEmail = false;
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding),
          vertical: getProportionateScreenWidth(kDefaultPadding * 2),
        ),
        child: Column(
          children: [
            SizedBox(
              child: Image.asset("assets/images/image_banner.png"),
            ),
            const Spacer(),
            Text(
              'Selected which contact detail should we use to  reset your password',
              style: TextStyle(fontSize: getProportionateScreenWidth(18)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelectedSmS = true;
                  isSelectedEmail = false;
                });
              },
              child: Container(
                padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: isSelectedSmS == true
                          ? Colors.white
                          : Colors.blueGrey.withOpacity(.2),
                      width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          getProportionateScreenWidth(kDefaultPadding)),
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(kDefaultPadding)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.2)),
                      child: const Icon(Icons.message_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'via SMS:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text('+84 8888***6878'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelectedEmail = true;
                  isSelectedSmS = false;
                });
              },
              child: Container(
                padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelectedEmail == true
                        ? Colors.white
                        : Colors.blueGrey.withOpacity(.1),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          getProportionateScreenWidth(kDefaultPadding)),
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(kDefaultPadding)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.2)),
                      child: const Icon(Icons.email_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'via Email:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text('abc****acs@*****.com'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: "Continue",
                color: isDarkMode ? Colors.white : Colors.black,
                colorText: isDarkMode ? Colors.black : Colors.white,
                press: () {
                  if (isSelectedSmS) {
                    Navigator.pushNamed(context, PinPasswordPage.route);
                  } else {
                    Navigator.pushNamed(context, PinPasswordPage.route);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
