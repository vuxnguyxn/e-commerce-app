import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class PackageStatus extends StatelessWidget {
  const PackageStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}

