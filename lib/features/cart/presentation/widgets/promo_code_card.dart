import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/cart_data.dart';
import 'discount_card.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({
    super.key,
    required this.brightness,
  });

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      width: double.infinity,
      height: getProportionateScreenWidth(48),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataPromoCode.length,
              itemBuilder: (context, index) => DiscountCard(
                content: dataPromoCode[index],
                brightness: brightness,
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: brightness == Brightness.light
                    ? Colors.black
                    : Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
