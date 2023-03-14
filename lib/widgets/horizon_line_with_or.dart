import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class HorizonLineWithOr extends StatelessWidget {
  const HorizonLineWithOr({
    super.key,
  });

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
        const Text('or'),
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
