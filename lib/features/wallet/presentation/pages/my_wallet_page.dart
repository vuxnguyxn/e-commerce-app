import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/title_offer_and_see_all.dart';
import 'package:e_commerce_app/features/wallet/data/simple_data.dart';
import 'package:e_commerce_app/features/wallet/presentation/pages/transaction_history_page.dart';
import 'package:flutter/material.dart';

import '../widgets/transaction_history_card.dart';

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
            TitleOfferAndSeeAll(
                title: 'Transaction History',
                press: () =>
                    Navigator.pushNamed(context, TransactionHistoryPage.route),),
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
