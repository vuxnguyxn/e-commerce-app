import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/cart_data.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.data,
    required this.brightness,
  });

  final Cart data;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getProportionateScreenWidth(kDefaultPadding / 2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: brightness == Brightness.light
              ? null
              : Colors.blueGrey.withOpacity(.2)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
            margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            width: getProportionateScreenWidth(SizeConfig.screenWidth * 0.3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: brightness == Brightness.light
                    ? Colors.grey.shade200
                    : Colors.blueGrey.withOpacity(.4)),
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
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(16)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: brightness == Brightness.light
                            ? Colors.blueGrey.withOpacity(.2)
                            : Colors.blueGrey.withOpacity(.4),
                      ),
                      child: Text(
                        "${data.quantity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
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
