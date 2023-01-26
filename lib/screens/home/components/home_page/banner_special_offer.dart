import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BannerSpecialOffer extends StatelessWidget {
  const BannerSpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/image_banner.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Stack(children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '30%\n',
                    style: TextStyle(
                      fontSize:
                          getProportionateScreenWidth(kDefaultPadding * 1.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Today's special\n",
                    style: TextStyle(
                      fontSize:
                          getProportionateScreenWidth(kDefaultPadding * 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Get discount for every order,\n only valid for today',
                    style: TextStyle(
                      fontSize:
                          getProportionateScreenWidth(kDefaultPadding * .7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

