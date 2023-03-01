import 'package:e_commerce_app/features/cart/presentation/pages/promo_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/cart_data.dart';
import 'discount_card.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

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
                isDarkMode: isDarkMode,
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.white : Colors.black),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, PromoPage.route);
              },
              icon: Icon(
                Icons.add,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
