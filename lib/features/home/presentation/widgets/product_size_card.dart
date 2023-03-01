import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class ProductSizeCard extends StatelessWidget {
  const ProductSizeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

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
                color: dataLetterSize[index].isSelected
                    ? (isDarkMode ? Colors.white : Colors.black)
                    : null,
                border: Border.all(
                    width: 1, color: isDarkMode ? Colors.white : Colors.black),
              ),
              child: Center(
                child: Text(
                  dataLetterSize[index].size,
                  style: TextStyle(
                      color: dataLetterSize[index].isSelected
                          ? (isDarkMode ? Colors.black : Colors.white)
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
