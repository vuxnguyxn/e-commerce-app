import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class HorizonLineWithOr extends StatelessWidget {
  const HorizonLineWithOr({
    super.key,
    required this.middleText,
  });

  final String middleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                right: getProportionateScreenWidth(kDefaultPadding)),
            height: 1,
            color: Colors.blueGrey.withOpacity(.2),
          ),
        ),
        Text(middleText),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(kDefaultPadding)),
            height: 1,
            color: Colors.blueGrey.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
