import 'package:e_commerce_app/features/cart/presentation/widgets/cart_remove_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_button.dart';
import '../../data/cart_data.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.data, required this.index});

  final Cart data;
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void _showDeleteModelBottomSheet(
      {required int index, required bool isDarkMode}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (builder) {
        return Container(
          height: getProportionateScreenWidth(400),
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(kDefaultPadding * 2),
              horizontal: getProportionateScreenWidth(kDefaultPadding)),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: isDarkMode ? kContentColorLightTheme : Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Remove From Cart?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              CartRemoveItem(
                data: dataCart[index],
                isDarkMode: isDarkMode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      title: 'Cancel',
                      color: isDarkMode
                          ? Colors.blueGrey.withOpacity(.2)
                          : Colors.grey.shade100,
                      colorText: isDarkMode ? Colors.white : Colors.black,
                      press: () {
                        //hide model bottom sheet
                        Navigator.pop(context);
                      }),
                  CustomButton(
                      title: 'Yes, Remove',
                      color: isDarkMode ? Colors.white : Colors.black,
                      colorText: isDarkMode ? Colors.black : Colors.white,
                      press: () {}),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int quantity = widget.data.quantity;
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(kDefaultPadding / 2)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(5)),
            margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            width: getProportionateScreenWidth(SizeConfig.screenWidth * 0.3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDarkMode
                    ? Colors.blueGrey.withOpacity(.2)
                    : Colors.grey.shade200),
            child: Image.asset(widget.data.image),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDeleteModelBottomSheet(
                            index: widget.index, isDarkMode: isDarkMode);
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: getProportionateScreenWidth(16),
                      height: getProportionateScreenWidth(16),
                      decoration: BoxDecoration(
                          color: widget.data.color, shape: BoxShape.circle),
                    ),
                    Text(
                      ' Color | Size = ${widget.data.size}',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.data.price}.00',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) widget.data.quantity--;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        Text(
                          "$quantity",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity < 20) widget.data.quantity++;
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
