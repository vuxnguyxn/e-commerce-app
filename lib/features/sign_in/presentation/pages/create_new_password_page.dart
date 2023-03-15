import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/sign_in/presentation/widgets/create_new_password_form.dart.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/check_remember_me.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  static const String route = '/create_new_password';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Password',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(kDefaultPadding),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset("assets/images/image_banner.png"),
            ),
            const Spacer(),
            const Text('Create Your New Password'),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            CreateNewPasswordForm(isDarkMode: isDarkMode),
             
          ],
        ),
      ),
    );
  }
}
