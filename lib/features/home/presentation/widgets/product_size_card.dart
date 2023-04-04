import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class ProductSizeCard extends StatefulWidget {
  const ProductSizeCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final List size;

  @override
  State<ProductSizeCard> createState() => _ProductSizeCardState();
}

class _ProductSizeCardState extends State<ProductSizeCard> {
  int isSelected = 0;
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
            itemCount: widget.size.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                setState(() {
                  isSelected = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected == index
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : null,
                  border: Border.all(
                      width: 1,
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
                child: Center(
                  child: Text(
                    widget.size[index],
                    style: TextStyle(
                        color: isSelected == index
                            ? (isDarkMode ? Colors.black : Colors.white)
                            : null),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
