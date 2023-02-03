import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class DotColor extends StatelessWidget {
  const DotColor({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => AnimatedContainer(
            margin:
                EdgeInsets.only(right: getProportionateScreenWidth(8)),
            duration: const Duration(seconds: 1),
            height: 6,
            width: currentIndex == index ? 20 : 6,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
