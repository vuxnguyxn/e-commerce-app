import 'package:e_commerce_app/features/home/presentation/widgets/banner_special_offer.dart';
import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';
import '../widgets/dot_color.dart';

class SpecialOfferPage extends StatefulWidget {
  const SpecialOfferPage({super.key});

  static const route = '/special_offer';

  @override
  State<SpecialOfferPage> createState() => _SpecialOfferPageState();
}

class _SpecialOfferPageState extends State<SpecialOfferPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Offer'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: SizedBox(
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, index) => bannerOfferAndDot(),
            itemCount: 5,
          )),
    );
  }

  SizedBox bannerOfferAndDot() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(220),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const BannerSpecialOffer(),
            itemCount: 5,
          ),
          Positioned(bottom: 40, child: DotColor(currentIndex: currentIndex)),
        ],
      ),
    );
  }
}
