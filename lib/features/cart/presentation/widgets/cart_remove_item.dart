import 'package:e_commerce_app/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../../data/cart_data.dart';

class CartRemoveItem extends StatelessWidget {
  const CartRemoveItem(
      {super.key, required this.data, required this.isDarkMode});

  final Cart data;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(kDefaultPadding),
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? Colors.black.withOpacity(.2) : Colors.white),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
            margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            width: getProportionateScreenWidth(SizeConfig.screenWidth * 0.3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDarkMode
                    ? Colors.blueGrey.withOpacity(.2)
                    : Colors.grey.shade200),
            child: Image.asset(data.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding / 2),
                ),
                Row(
                  children: [
                    Container(
                      width: getProportionateScreenWidth(16),
                      height: getProportionateScreenWidth(16),
                      decoration: BoxDecoration(
                          color: data.color, shape: BoxShape.circle),
                    ),
                    Text(
                      ' Color | Size = ${data.size}',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${data.price}.00',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                        Text(
                          "${data.quantity}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
