import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

class ItemBar extends StatelessWidget {
  const ItemBar({
    Key? key,
    required this.press,
    required this.icon,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  final VoidCallback press;
  final IconData icon;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * .5, vertical: kDefaultPadding * .5),
        child: Column(
          children: [
            Icon(icon),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              title,
              style:
                  TextStyle(color: isSelected ? Colors.black : Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
