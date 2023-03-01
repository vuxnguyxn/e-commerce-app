import 'package:e_commerce_app/features/cart/presentation/widgets/promo_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/horizon_line.dart';
import '../../data/cart_data.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  static const String route = '/promo';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Promo',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      dataPromo.length,
                      (index) => PromoItem(
                        index: index,
                        isDarkMode: isDarkMode,
                        data: dataPromo[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HorizonLine(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: getProportionateScreenWidth(kDefaultPadding / 2),
                  bottom: getProportionateScreenWidth(kDefaultPadding)),
              child: CustomButton(
                  title: 'Apply',
                  color: isDarkMode ? Colors.white : Colors.black,
                  colorText: isDarkMode ? Colors.black : Colors.white,
                  press: () {}),
            )
          ],
        ),
      ),
    );
  }
}
