import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';
import 'most_popular_item_cart.dart';

class ResultForSearchCard extends StatelessWidget {
  const ResultForSearchCard({
    Key? key,
    required this.textSearch,
    required this.resultFound,
  }) : super(key: key);

  final String textSearch;
  final String resultFound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Result for "$textSearch"',
                overflow: textSearch.length > 10 ? TextOverflow.ellipsis : null,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '$resultFound found',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  MostPopularItemCard(data: dataItemMostPopular[index]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .6,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding),
              itemCount: dataItemMostPopular.length,
            ),
          )
        ],
      ),
    );
  }
}
