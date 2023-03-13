import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class OrderStatusDetailCard extends StatelessWidget {
  const OrderStatusDetailCard({
    super.key,
    required this.data,
  });

  final DetailStatus data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: getProportionateScreenWidth(kDefaultPadding)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(kDefaultPadding),
            height: getProportionateScreenHeight(kDefaultPadding),
            margin: EdgeInsets.only(
                right: getProportionateScreenWidth(kDefaultPadding)),
            child: const Center(child: Icon(Icons.delivery_dining)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18)),
                        children: [
                          TextSpan(
                            text: '${data.title} - ',
                          ),
                          TextSpan(text: data.dayOfMonth)
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      data.time,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                      ),
                    )
                  ],
                ),
                Text(
                  data.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
