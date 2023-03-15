import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/otp_form.dart';

class PinPasswordPage extends StatefulWidget {
  const PinPasswordPage({super.key});

  static const String route = '/ping_password_page';

  @override
  State<PinPasswordPage> createState() => _PinPasswordPageState();
}

class _PinPasswordPageState extends State<PinPasswordPage> {
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
        padding: EdgeInsets.all(
          getProportionateScreenWidth(kDefaultPadding),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('Code has been send to +84 0099*****784'),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            const OTPForm(),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            buildTimer(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  title: "Verify",
                  color: isDarkMode ? Colors.white : Colors.black,
                  colorText: isDarkMode ? Colors.black : Colors.white,
                  press: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Resent code in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
          ),
          onEnd: () {},
        ),
        const Text(" s"),
      ],
    );
  }
}
