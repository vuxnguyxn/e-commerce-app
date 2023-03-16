import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({
    super.key,
    required this.data, required this.isDarkMode,
  });

  final TransactionHistory data;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding),
          vertical: getProportionateScreenWidth(kDefaultPadding / 4)),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(48),
            height: getProportionateScreenWidth(48),
            margin: EdgeInsets.only(
                right: getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.blueGrey.withOpacity(.4)),
            padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding / 4)),
            child: data.type == TransactionHistoryType.order
                ? Image.asset(data.image)
                : Icon(
                    Icons.wallet,
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding / 4),
                ),
                Text(
                  '${data.date} | ${data.time}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(.7),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${data.price}',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding / 4),
              ),
              Row(
                children: [
                  Text(
                    data.type == TransactionHistoryType.order
                        ? 'Orders'
                        : 'Top Up',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(.7),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(kDefaultPadding / 4),
                  ),
                  Container(
                    color: data.type == TransactionHistoryType.order
                        ? Colors.red
                        : Colors.blue,
                    child: Icon(
                      Icons.add,
                      size: getProportionateScreenWidth(12),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
