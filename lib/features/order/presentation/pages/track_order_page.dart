import 'package:e_commerce_app/features/order/data/simple_data.dart';
import 'package:e_commerce_app/widgets/horizon_line.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../widgets/order_completed_detail_card.dart';
import '../widgets/order_status_detail_card.dart';
import '../widgets/package_status.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage(
      {super.key, required this.isDarkMode, required this.data});

  final Order data;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track Order',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(kDefaultPadding / 2),
                    vertical: getProportionateScreenWidth(kDefaultPadding)),
                child: OrderCompletedDetailCard(
                    isDarkMode: isDarkMode, data: data)),
            const PackageStatus(),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding),
            ),
            Center(child: Text('Package ${data.status}')),
            const HorizonLine(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(kDefaultPadding)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Status Detail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(kDefaultPadding),
                  ),
                  ...List.generate(
                    data.detailStatus.length,
                    (index) => OrderStatusDetailCard(
                      data: data.detailStatus[index],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
