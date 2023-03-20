import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.color,
      required this.colorText,
      this.isProcess = false,
      required this.press});

  final String title;
  final Color color;
  final Color colorText;
  final VoidCallback press;
  final bool isProcess;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
       borderRadius: BorderRadius.circular(50),
      child: Container(
        height: getProportionateScreenWidth(kDefaultPadding * 2.5),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding * 1.5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcess)
              CircularProgressIndicator(
                color: colorText,
                strokeWidth: 3,
              )
            else
              Text(
                title,
                style: TextStyle(
                    color: colorText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
