import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class OrderCompletedDetailCard extends StatelessWidget {
  const OrderCompletedDetailCard({
    super.key,
    required this.isDarkMode,
    required this.data,
  });

  final bool isDarkMode;
  final Order data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDarkMode
            ? Colors.blueGrey.withOpacity(.1)
            : kContentColorDarkTheme,
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * .3,
            margin: EdgeInsets.only(
                right: getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDarkMode
                  ? Colors.blueGrey.withOpacity(.2)
                  : Colors.blueGrey.withOpacity(.1),
            ),
            child: Image.asset(
              data.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          getProportionateScreenWidth(kDefaultPadding / 4)),
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenWidth(16),
                        width: getProportionateScreenWidth(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: data.color,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(12)),
                          children: [
                            const TextSpan(text: ' Color'),
                           if(data.size != null) TextSpan(text: ' | Size = ${data.size}'),
                            TextSpan(text: ' | Qty = ${data.quantity}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '\$${data.price}.00',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
