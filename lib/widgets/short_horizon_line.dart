import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class ShortHorizonLine extends StatelessWidget {
  const ShortHorizonLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDefaultPadding,
      margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(kDefaultPadding),
          top: getProportionateScreenWidth(kDefaultPadding / 2)),
      height: 2,
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.5),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
