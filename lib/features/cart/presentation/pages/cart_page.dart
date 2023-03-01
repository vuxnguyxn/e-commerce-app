import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/check_out_page.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button_and_icon.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
            ),
            child: ListView.builder(
              itemCount: dataCart.length,
              itemBuilder: (context, index) => CartItem(
                data: dataCart[index],
                index: index,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Text(
                      "\$800.00",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              CustomButtonAndIcon(
                title: 'Checkout',
                icon: Icons.arrow_forward_outlined,
                press: () => Navigator.pushNamed(context, CheckoutPage.route),
              ),
            ],
          ),
        )
      ],
    );
  }
}
