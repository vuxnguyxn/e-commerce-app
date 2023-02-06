import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

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
