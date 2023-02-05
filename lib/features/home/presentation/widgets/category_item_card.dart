import 'package:e_commerce_app/features/home/presentation/pages/categories_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(80),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CategoriesPage.route);
            },
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                child: const Icon(Icons.shopping_bag)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          const Text('Title'),
        ],
      ),
    );
  }
}
