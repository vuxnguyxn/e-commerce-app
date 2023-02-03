import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/dot_color.dart';
import 'package:flutter/material.dart';

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
                            color: Colors.black.withOpacity(0.05),
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
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          style: TextStyle(fontSize: 12),
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Row soldAndReviews() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200),
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

class TotalPriceAndAddToCart extends StatelessWidget {
  const TotalPriceAndAddToCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              const Text(
                "\$800",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding * 2.5)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_basket,
              size: 16,
              color: Colors.white,
            ),
            label: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class ProductSizeCard extends StatelessWidget {
  const ProductSizeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenWidth(kDefaultPadding / 2),
        ),
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenWidth(kDefaultPadding * 2),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataLetterSize.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dataLetterSize[index].isSelected ? Colors.black : null,
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Center(
                child: Text(
                  dataLetterSize[index].size,
                  style: TextStyle(
                      color: dataLetterSize[index].isSelected
                          ? Colors.white
                          : null),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ProductColorCard extends StatelessWidget {
  const ProductColorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: getProportionateScreenWidth(kDefaultPadding / 2),
        ),
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenWidth(kDefaultPadding * 2),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataChooseColor.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dataChooseColor[index].color,
              ),
              child: Center(
                child: dataChooseColor[index].isSelected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
