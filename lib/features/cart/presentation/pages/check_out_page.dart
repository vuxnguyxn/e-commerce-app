import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/cart/data/cart_data.dart';
import 'package:e_commerce_app/widgets/custom_button_and_icon.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/horizon_line.dart';
import '../widgets/choose_shipping.dart';
import '../widgets/order_item.dart';
import '../widgets/promo_code_card.dart';
import '../widgets/shipping_address.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const route = '/checkout';

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HorizonLine(),
              const Text(
                'Shipping Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding / 2),
              ),
              ShippingAddress(brightness: brightness),
              const HorizonLine(),
              const Text(
                'Order List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                dataCart.length,
                (index) => OrderItem(
                  data: dataCart[index],
                  brightness: brightness,
                ),
              ),
              const HorizonLine(),
              const Text(
                'Choose Shipping',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding / 2),
              ),
              ChooseShipping(brightness: brightness),
              const HorizonLine(),
              const Text(
                'Promo Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              PromoCodeCard(brightness: brightness),
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * .3,
                padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding)),
                margin: EdgeInsets.only(
                    top: getProportionateScreenWidth(kDefaultPadding / 2),
                    bottom: kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      titleAndContent(title: 'Amount', content: '1900'),
                      titleAndContent(title: 'Shipping', content: '15'),
                      titleAndPromo(title: 'Promo', content: '591'),
                      const HorizonLine(),
                      titleAndContent(title: 'Amount', content: '1394'),
                    ]),
              ),
              const HorizonLine(),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
              CustomButtonAndIcon(
                  brightness: brightness,
                  title: 'Continued to Payment',
                  icon: Icons.arrow_forward,
                  press: () {}),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row titleAndContent({required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text('\$$content.00'),
      ],
    );
  }
  Row titleAndPromo({required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text('- \$$content.00'),
      ],
    );
  }
}
