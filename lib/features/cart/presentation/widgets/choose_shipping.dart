import 'package:e_commerce_app/features/cart/presentation/pages/choose_shipping_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class ChooseShipping extends StatelessWidget {
  const ChooseShipping({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? Colors.blueGrey.withOpacity(.2) : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(.2), width: 2),
                  shape: BoxShape.circle,
                  color: isDarkMode ? Colors.white : Colors.black),
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Icon(
                Icons.delivery_dining,
                color: isDarkMode ? Colors.black : Colors.white,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Regular',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(kDefaultPadding / 4),
              ),
              const Text(
                'Estimated...Dec 22-10',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Row(
            children: [
              const Text('\$15'),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ChooseShippingPage.route);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
