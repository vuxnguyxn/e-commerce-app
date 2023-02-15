import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.color,
      required this.colorText,
      required this.press});

  final String title;
  final Color color;
  final Color colorText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding * 2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: TextButton(
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
