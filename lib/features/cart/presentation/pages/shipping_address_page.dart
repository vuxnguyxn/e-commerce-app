import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/horizon_line.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../widgets/shipping_address_item.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({super.key});
  static const String route = '/shipping_address';

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping Address'),
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
                      dataShippingAddress.length,
                      (index) => ShippingAddressItem(
                        index: index,
                        brightness: brightness,
                        data: dataShippingAddress[index],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical:
                              getProportionateScreenWidth(kDefaultPadding)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: brightness == Brightness.light
                              ? Colors.blueGrey.withOpacity(.2)
                              : Colors.blueGrey.withOpacity(.3)),
                      child: TextButton(
                        child: Text(
                          'Add New Address',
                          style: TextStyle(
                              color: brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        onPressed: () {},
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
