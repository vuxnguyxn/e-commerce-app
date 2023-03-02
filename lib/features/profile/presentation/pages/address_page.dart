import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/data/cart_data.dart';

import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/shipping_address.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  static const String route = '/address';

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Address',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      dataShippingAddress.length,
                      (index) => ShippingAddress(
                          data: dataShippingAddress[index],
                          isDarkMode: isDarkMode),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(kDefaultPadding)),
              child: CustomButton(
                  title: 'Add New Address',
                  color: isDarkMode ? Colors.white : Colors.black,
                  colorText: isDarkMode ? Colors.black : Colors.white,
                  press: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
