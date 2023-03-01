import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Notifications data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.date,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          Column(
            children: List.generate(
              data.notifications.length,
              (index) => notificationItem(index, context),
            ),
          ),
        ],
      ),
    );
  }

  Container notificationItem(int index, BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    Map<String, IconData> iconNotification = {
      'wallet': Icons.wallet,
      'account': Icons.account_circle,
      'location': Icons.location_on,
      'discount': Icons.discount,
      'credit': Icons.credit_card,
    };
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(60),
            padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding / 2)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode ? Colors.white : Colors.black),
            child: Icon(
              iconNotification[data.notifications[index].image],
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(kDefaultPadding),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.notifications[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(kDefaultPadding / 2),
                ),
                Text(data.notifications[index].content),
              ],
            ),
          )
        ],
      ),
    );
  }
}
