import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/choose_shipping_item.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/horizon_line.dart';

class ChooseShippingPage extends StatelessWidget {
  const ChooseShippingPage({super.key});

  static const String route = '/choose_shipping';

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Shipping'),
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
                      dataChooseShippingAddress.length,
                      (index) => ChooseShippingItem(
                        index: index,
                        brightness: brightness,
                        data: dataChooseShippingAddress[index],
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
                  color: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  colorText: brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                  press: () {}),
            )
          ],
        ),
      ),
    );
  }
}
