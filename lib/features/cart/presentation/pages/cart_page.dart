import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/check_out_page.dart';
import 'package:e_commerce_app/provider/total_provider.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button_and_icon.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final uid = AuthRepository().currentUser!.uid;
    final query = FirebaseDatabase.instance.ref('carts/$uid');

    return Consumer<TotalProvider>(
      builder: (context, provider, build) => Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(kDefaultPadding),
              ),
              child: FirebaseAnimatedList(
                query: query,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  if (snapshot.exists) {
                    Map map = snapshot.value as Map;
                    map['keys'] = snapshot.key;
                    return CartItem(
                      provider: provider,
                      data: map,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
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
                      Text(
                        "\$${provider.getTotalAll}.00",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
