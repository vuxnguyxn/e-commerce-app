import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithCounter extends StatelessWidget {
  const IconButtonWithCounter({
    Key? key,
    required this.svg,
    this.numOfItems,
    required this.press,
  }) : super(key: key);

  final String svg;
  final int? numOfItems;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Container(
            padding:  EdgeInsets.all(getProportionateScreenWidth(12)),
            width: getProportionateScreenWidth(48),
            height: getProportionateScreenWidth(48),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svg,
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              top: getProportionateScreenWidth(10),
              right: getProportionateScreenHeight(10),
              child: Container(
                height: getProportionateScreenHeight(10),
                width: getProportionateScreenWidth(10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: .5)),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(color: Colors.white, fontSize: getProportionateScreenWidth(8)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
