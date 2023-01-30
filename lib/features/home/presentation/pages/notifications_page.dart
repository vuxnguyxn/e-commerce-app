import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const String route = '/notification';

  @override
  Widget build(BuildContext context) {
    List data = dataNotifications;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenWidth(kDefaultPadding)),
          width: double.infinity,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  NotificationCard(data: data[index])),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Notifiactions data;

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
              (index) => notificationItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Container notificationItem(int index) {
    Map<String, IconData> iconNoti = {
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
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: Icon(
              iconNoti[data.notifications[index].image],
              color: Colors.white,
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
