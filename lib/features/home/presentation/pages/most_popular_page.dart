import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_item_cart.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class MostPopularPage extends StatelessWidget {
  const MostPopularPage({super.key});
  static const route = '/most_popular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          mostPopularTabbar(),
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight - getProportionateScreenWidth(160),
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(kDefaultPadding),
                left: getProportionateScreenWidth(kDefaultPadding),
                right: getProportionateScreenWidth(kDefaultPadding / 2)),
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  MostPopularItemCard(data: dataItemMostPopular[index]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .63,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding),
              itemCount: dataItemMostPopular.length,
            ),
          )
        ],
      ),
    );
  }

  Container mostPopularTabbar() {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2),
      margin: EdgeInsets.only(
          top: getProportionateScreenWidth(kDefaultPadding),
          left: getProportionateScreenWidth(kDefaultPadding),
          right: getProportionateScreenWidth(kDefaultPadding / 2)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataTitleMostPopular.length,
        itemBuilder: (context, index) => MostPopularTabBar(
          data: dataTitleMostPopular[index],
          press: () {},
        ),
      ),
    );
  }
}
