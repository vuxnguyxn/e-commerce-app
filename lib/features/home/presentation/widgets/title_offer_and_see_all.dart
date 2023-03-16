import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class TitleOfferAndSeeAll extends StatelessWidget {
  const TitleOfferAndSeeAll({
    required this.title,
    required this.press,
    Key? key,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(kDefaultPadding),
        top: getProportionateScreenWidth(kDefaultPadding),
        right: getProportionateScreenWidth(kDefaultPadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: press,
            child: Text(
              "See All",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
