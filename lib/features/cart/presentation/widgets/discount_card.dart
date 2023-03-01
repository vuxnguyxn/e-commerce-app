import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    required this.content,
    required this.isDarkMode,
  });

  final String content;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(kDefaultPadding / 2)),
      margin: EdgeInsets.only(
        right: getProportionateScreenWidth(kDefaultPadding / 2),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blueGrey.withOpacity(.4)),
      child: Row(
        children: [
          Text(content),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cancel_rounded,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
