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
  void _showDeleteModelBottomSheet(int index) {
    final lightMode = MediaQuery.of(context).platformBrightness;
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
              color: lightMode == Brightness.light
                  ? Colors.white
                  : kContentColorLightTheme),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Remove From Cart?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              CartRemoveItem(data: dataCart[index]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      title: 'Cancel',
                      color: lightMode == Brightness.light
                          ? Colors.grey.shade100
                          : Colors.blueGrey.withOpacity(.2),
                      colorText: lightMode == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      press: () {
                        //hide model bottom sheet
                        Navigator.pop(context);
                      }),
                  CustomButton(
                      title: 'Yes, Remove',
                      color: lightMode == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      colorText: lightMode == Brightness.light
                          ? Colors.white
                          : Colors.black,
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
    final lightMode = MediaQuery.of(context).platformBrightness;
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
                color: lightMode == Brightness.light
                    ? Colors.grey.shade200
                    : Colors.blueGrey.withOpacity(.2)),
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
                        _showDeleteModelBottomSheet(widget.index);
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
