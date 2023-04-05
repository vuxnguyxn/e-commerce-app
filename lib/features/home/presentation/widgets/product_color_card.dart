import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class ProductColorCard extends StatefulWidget {
  const ProductColorCard({
    Key? key,
    required this.color,
  }) : super(key: key);

  final List color;

  @override
  State<ProductColorCard> createState() => _ProductColorCardState();
}

class _ProductColorCardState extends State<ProductColorCard> {
  Color chooseColor(String color) {
    switch (color) {
      case "green":
        return Colors.green;
      case "yellow":
        return Colors.yellow;
      case "blue":
        return Colors.blue;
      case "pink":
        return Colors.pink;
      case "grey":
        return Colors.grey;
      case "white":
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  int isSelected = 0;
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
            itemCount: widget.color.length,
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
                  color: chooseColor(widget.color[index]),
                ),
                child: Center(
                  child: isSelected == index
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
