import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/title_offer_and_see_all.dart';
import 'package:e_commerce_app/features/wallet/data/simple_data.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My E-Wallet',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: getProportionateScreenWidth(kDefaultPadding * 9),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding),
                vertical: getProportionateScreenWidth(kDefaultPadding),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDarkMode
                    ? Colors.blueGrey.withOpacity(.2)
                    : Colors.black54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Peter Parker',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(22))),
                      SizedBox(
                          height:
                              getProportionateScreenWidth(kDefaultPadding / 4)),
                      Text(
                        '*** *** *** 890',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(14)),
                      ),
                      const Spacer(),
                      Text(
                        'Your balance',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(14)),
                      ),
                      SizedBox(
                          height:
                              getProportionateScreenWidth(kDefaultPadding / 4)),
                      Text(
                        '\$9,873',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(30),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenWidth(
                                kDefaultPadding / 2),
                            horizontal:
                                getProportionateScreenWidth(kDefaultPadding)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Icon(
                              Icons.wallet,
                              size: getProportionateScreenWidth(16),
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(
                                  kDefaultPadding / 4),
                            ),
                            const Text(
                              'Top Up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            TitleOfferAndSeeAll(title: 'Transaction History', press: () {}),
            SizedBox(
              height: getProportionateScreenWidth(kDefaultPadding / 2),
            ),
            Column(
              children: [
                ...List.generate(
                  dataTransactionHistory.length,
                  (index) => TransactionHistoryCard(
                    isDarkMode: isDarkMode,
                    data: dataTransactionHistory[index],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
