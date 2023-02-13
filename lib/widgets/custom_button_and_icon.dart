import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class CustomButtonAndIcon extends StatelessWidget {
  const CustomButtonAndIcon({
    super.key,
    required this.brightness,
    required this.title,
    required this.icon, required this.press,
  });

  final Brightness brightness;
  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding * 2.5),
            vertical: kDefaultPadding *.75),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                // ignore: unrelated_type_equality_checks
                brightness == Brightness.light ? Colors.black : Colors.white),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: brightness == Brightness.light
                      ? Colors.white
                      : Colors.black),
            ),
            SizedBox(
              width: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            Icon(
              icon,
              size: 20,
              color:
                  brightness == Brightness.light ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
