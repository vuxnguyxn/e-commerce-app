import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/check_out_page.dart';
import 'package:e_commerce_app/provider/total_provider.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_button_and_icon.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  Widget build(BuildContext context) {
    final uid = AuthRepository().currentUser!.uid;
    final query = FirebaseDatabase.instance.ref('carts/$uid');
   
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
            ),
            child: Expanded(
              child: FirebaseAnimatedList(
                query: query,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map map = snapshot.value as Map;
                  map['keys'] = snapshot.key;
                  //add price in provider 
                  context
                      .read<TotalProvider>()
                      .totalPrice(price: map['price'] * map['quantity']);
                  return CartItem(
                    data: map,
                  );
                },
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
                    Text(
                      "\$${context.read<TotalProvider>().getTotal}.00",
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
    );
  }
}
