import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class CustomButtonAndIcon extends StatelessWidget {
  const CustomButtonAndIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding * 2.5),
            vertical: kDefaultPadding * .75),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                // ignore: unrelated_type_equality_checks
                isDarkMode ? Colors.white : Colors.black),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDarkMode ? Colors.black : Colors.white),
            ),
            SizedBox(
              width: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            Icon(
              icon,
              size: 20,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
