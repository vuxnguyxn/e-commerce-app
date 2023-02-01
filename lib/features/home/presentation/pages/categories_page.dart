import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../data/simple_data.dart';
import '../widgets/most_popular_item_cart.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  static const route = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothes"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
          itemCount: dataItemMostPopular.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
              crossAxisSpacing: kDefaultPadding,
              mainAxisSpacing: kDefaultPadding),
          itemBuilder: (context, index) =>
              MostPopularItemCard(data: dataItemMostPopular[index]),
        ),
      ),
    );
  }
}
