import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets/notification_cart.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
