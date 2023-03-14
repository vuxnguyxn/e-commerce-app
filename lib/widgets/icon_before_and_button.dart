import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class IconBeforeAndButton extends StatelessWidget {
  const IconBeforeAndButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(kDefaultPadding/4)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }
}