import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  Widget build(BuildContext context) {
    final lightMode = MediaQuery.of(context).platformBrightness;
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
                    )),
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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(kDefaultPadding * 2.5)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:
                        // ignore: unrelated_type_equality_checks
                        lightMode == Brightness ? Colors.black : Colors.white),
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Checkout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: lightMode == Brightness.light
                            ? Colors.white
                            : Colors.black),
                  ),
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: lightMode == Brightness.light
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
