import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/dot_color.dart';
import 'package:flutter/material.dart';

import '../widgets/product_color_card.dart';
import '../widgets/product_size_card.dart';
import '../widgets/total_price_and_add_to_cart.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const route = '/product_detail';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentIndex = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final lightMode = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listImageAndDotColor(),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(kDefaultPadding)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleAndFavorites(),
                  soldAndReviews(),
                  SizedBox(
                      height: getProportionateScreenHeight(kDefaultPadding)),
                  description(),
                  SizedBox(
                      height: getProportionateScreenHeight(kDefaultPadding)),
                  const ProductSizeCard(),
                  SizedBox(
                      height: getProportionateScreenHeight(kDefaultPadding)),
                  const ProductColorCard(),
                  SizedBox(
                      height: getProportionateScreenHeight(kDefaultPadding)),
                  Row(
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(kDefaultPadding),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: lightMode == Brightness.light
                                ? Colors.black.withOpacity(0.05)
                                : Colors.blueGrey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              "$quantity",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity < 20) quantity++;
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: getProportionateScreenHeight(kDefaultPadding)),
                  const TotalPriceAndAddToCart(),
                  SizedBox(
                      height:
                          getProportionateScreenHeight(kDefaultPadding * 2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(kDefaultPadding / 2),
        ),
        const Text("This is description",
          style: TextStyle(fontSize: 12),
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Row soldAndReviews() {
    final lightMode = MediaQuery.of(context).platformBrightness;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: lightMode == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.blueGrey.withOpacity(.2)),
          child: const Text(
            "3,200 sold",
            style: TextStyle(fontSize: 12),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(kDefaultPadding),
        ),
        const Icon(Icons.star_half),
        const Text(
          '4.6 (4,780 reviews)',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Row titleAndFavorites() {
    return Row(
      children: [
        const Text(
          'Snake Leather Bag',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
      ],
    );
  }

  Stack listImageAndDotColor() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight / 2,
          color: Colors.black.withOpacity(.05),
          child: AspectRatio(
            aspectRatio: 1,
            child: PageView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) => Image.asset(
                "assets/images/bag_1.png",
                scale: 1,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: kDefaultPadding,
            child: DotColor(currentIndex: currentIndex))
      ],
    );
  }
}
