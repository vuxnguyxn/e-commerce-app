import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/size_config.dart';

class IconSignIn extends StatelessWidget {
  const IconSignIn({
    super.key,
    required this.press,
    required this.icon,
  });
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding),
          vertical: getProportionateScreenWidth(kDefaultPadding / 2),
        ),
        margin: EdgeInsets.only(
          top: getProportionateScreenWidth(kDefaultPadding),
          bottom: getProportionateScreenWidth(kDefaultPadding * 2),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey.withOpacity(.2)),
        child: Icon(icon),
      ),
    );
  }
}
