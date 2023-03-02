import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/shipping_address_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    super.key,
    required this.isDarkMode,
    required this.data,
  });

  final bool isDarkMode;
  final DeliveryAddress data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(kDefaultPadding / 2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? Colors.blueGrey.withOpacity(.2) : null),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(.2), width: 2),
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.white : Colors.black),
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
            child: Icon(
              Icons.location_on,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      data.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (data.isSelected)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(
                                kDefaultPadding / 2)),
                        margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(
                                kDefaultPadding / 2)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey.withOpacity(.4),
                        ),
                        child: Text(
                          'Default',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(12)),
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding / 4),
                ),
                Text(
                  data.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, ShippingAddressPage.route),
          ),
        ],
      ),
    );
  }
}
