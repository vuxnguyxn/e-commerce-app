import 'package:e_commerce_app/features/order/data/simple_data.dart';
import 'package:e_commerce_app/widgets/horizon_line.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

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
            OrderCompletedDetailCard(isDarkMode: isDarkMode, data: data),
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
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PackageStatus extends StatelessWidget {
  const PackageStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(Icons.card_giftcard),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            const Icon(
              Icons.check_circle,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}

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
                      Text(
                        ' Color | Size = ${data.size} | Qty = ${data.quantity}',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(12)),
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
            child: const Center(child: Icon(Icons.circle_outlined)),
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
