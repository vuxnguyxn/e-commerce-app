import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/order/data/simple_data.dart';
import 'package:flutter/material.dart';

class OngoingCard extends StatelessWidget {
  const OngoingCard(
      {super.key,
      required this.data,
      required this.isDarkMode,
      required this.textButton,
      required this.pressButton});

  final Order data;
  final bool isDarkMode;
  final String textButton;
  final VoidCallback pressButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          vertical: getProportionateScreenWidth(kDefaultPadding) / 4),
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
                            if (data.size != null)
                              TextSpan(text: ' | Size = ${data.size}'),
                            TextSpan(text: ' | Qty = ${data.quantity}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getProportionateScreenWidth(kDefaultPadding / 2),
                          vertical:
                              getProportionateScreenWidth(kDefaultPadding / 4)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isDarkMode
                              ? Colors.blueGrey.withOpacity(.2)
                              : Colors.blueGrey.withOpacity(.1)),
                      child: Center(child: Text(data.status)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${data.price}.00',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: pressButton,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(
                                kDefaultPadding / 2),
                            horizontal:
                                getProportionateScreenWidth(kDefaultPadding)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isDarkMode
                                ? Colors.blueGrey.withOpacity(.3)
                                : Colors.black),
                        child: Center(
                            child: Text(
                          textButton,
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
